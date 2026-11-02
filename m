Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B5560A2637
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HxGf70OF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kr1qAG2/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=; b=HxGf70OF6V1i3d
	NtriSgP7GOzc+2ki0Ior/SA4zV65GAoKT4ww/4C3RJHiIhEF/oqLM4MzfqsB/1KHQ5T8vIN2/sYtj
	rDGm/IcsG2Whwr1f2H0EGQ7IuzOWrPM4Va+AKVGlkRgK3Ly4NB50OEJ9P0IvFgasvpcYG+3UasOlX
	j6KjN0T5o78AKPkr++XiccTDVbUbKsqpENYt6m+SjYfiIIFFVmquANTidevLUB2dMmWGr2+DM5Ilw
	ikeamMvi4A+lSvYuARLSVF/k5zvr9Vcw50WtKi9Q8HRksvwumJ7DMA/kOQspMeDssZXECoW5OloRz
	1V6sRrHHzSP1ePLnhoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5v-0000000HVOA-0uJe;
	Mon, 02 Nov 2026 17:45:19 +0000
Received: from mail-dl2-x07.google.com ([2607:f8b0:4864:38::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5s-0000000HVLZ-3ix6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:45:18 +0000
Received: by mail-dl2-x07.google.com with SMTP id a92af1059eb24-139b659a45eso683649c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641516; x=1794246316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=kr1qAG2/MfH4CZS0GdqDVp2I+gvvANqVZNq/lTluT39Ks9/mSdOMi8kRLEON1YcDwD
         zz1sC332dwnm9+c8DKQ6+rCV4Gt/AcC24P4JVd7iqNdKrNmnax/p/6bBVhMbdIdS3hQa
         oFAADHV1DYqygg8jllYrmVO6l92ie+O5AfK2nXZPG5SFX8Hju4SCZdRsdso1uSoEauow
         t3BWwsnxkU2FmZxtaoAnzQfbZ04Zap6Y9KgGqdnpvwSRjz9l65p8+cm+hIZrNEQuohuv
         o/0ltz3/BmYEDLgPrnbl2Nrt8ael6rogUcw2iWmZzIv7Yz0y3VRiJJFv2gV6vVURHFHe
         kH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641516; x=1794246316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=Fh6IRS/bylOq+zS6fKVmP4gYgXgjoIiNYDFOlout+3Jxq44Hc0PHpvT85xPNXeXY6n
         CUYJil+a7vs/KDiX9Ah5NQFU1Me1IDDjeXaq/4qYxJXkiZgQc0NYlh1Z4AgPp3zh0hnz
         kOFqUP4EbtTcgIy2bGXjn6AN1yk4te/zJlxWkjjhX27oIy+YliRcf7fkvqgVv5EQt/U4
         1W+Yf4xjx+oPRJGz8v6nufAqPS/qQyASnZYbyaPYrLX4wAO1WcZGUVw1kALgiGsOe6JX
         py5unr0dgIG0+Jxf0DycJzpDjp7TjNaPJCprMOMaNmRaGN0FOXaHhNXeH2JvrA3nDvuz
         nG0g==
X-Forwarded-Encrypted: i=1; AKwUvByA/rFzqmtdxNT9TQ2EfGweY7nb33FCtoEmLGjRco4oBdd+9pWBBsQXA+FlaEIahIuQ3FgSWSlfoQKsya9Upom7@lists.infradead.org
X-Gm-Message-State: APuU4Z/sovJ9u9/2Z4N+JjNoehPALb+s3TnyFUTpiTilmUGO0f1nB+zP
	WCSzPRqbFL89k+H8Qa10Vb2SsYSCnwEyJF0m++KsAlgv5ZTbr+b+Zb+i
X-Gm-Gg: AYBFou3jmEfHJdKKdo3bqNpAd+iLOV02WOGgl+SqVrvjBbwxDkVt2faAwpbXAMkZ6ef
	LNCuMckwmFb/G/jnAkdhSkLOwnLOJXa7rg8cYj9anrNUFbiB6UdytQHP5goVJs4LhLZK2wmezLu
	EKIehXJV1LezCS7/PzU+1JCpB8YD0TuUUM6ZKqs26KzmW2Cj7dcWyM9nrebj1BjAlUk7yx/sYUs
	0T8FgkKeRXSxMKQk28i0X6Ud8tnCgBB9XQaD6noZHLQTJHcVK32RI3Bmr72IkYG6/+fYz641JT2
	rY7U0cYBm1seyyOFWkMlyAscBWrfxyTYW1riVlTq24KUPQkZ4luvJ70KbhuL+dNP9oRbp3Ppb5A
	dji8Jm6WJy394+LCmG1dSMsCh3/cmL46mMoPI1GdRObBtKlu9ywUwfuBm5WcU+KsIcAt5KbSgQR
	mH7OU+lQLZ8478AcjXbVDECR3Z6fjyfUmL7ZAySsLv1sfV0r9YiQOK53SjtUApFFa8v7GwQWjny
	dj+6FlpEAoEyGq4nyX0WV96kNjXJf4iqp6Dbe4ViLgLndZGTluyIVa1PENumC7yc8HqfNhl6ZID
	fX7lLzwbs05UpGkMCobwZ8xzTUk=
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr15885436eec.11.1793641515587;
        Mon, 02 Nov 2026 09:45:15 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:15 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 4/6] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Tue,  3 Nov 2026 01:44:48 +0800
Message-ID: <20261102174450.3000397-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094516_924403_8F9E62F7 
X-CRM114-Status: GOOD (  14.60  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RGMII WAN port on the Ariaboard Photonicat uses SCLK_GMAC1 as the
GMAC main clock and SCLK_GMAC1_RX_TX as the RGMII speed clock. Only the
parent of SCLK_GMAC1_RX_TX is set, so SCLK_GMAC1 keeps whatever parent
the bootloader or the hardware reset left.

Set the parent of SCLK_GMAC1 to CLK_MAC1_2TOP explicitly, so the GMAC
main clock always uses the internal source and does not depend on the
bootloader state. The rate assignment is unchanged: SCLK_GMAC1_RX_TX
keeps its rate unset, SCLK_GMAC1 stays at 125 MHz.

Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index b719d5b661c43..7e0a2ab829209 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -285,7 +285,7 @@ &gmac0 {
 /* Motorcomm YT8521SC WAN port */
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
-- 
2.47.3


