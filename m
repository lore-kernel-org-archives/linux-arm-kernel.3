Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763F606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UJv1yoxQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dfISi4NF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=; b=UJv1yoxQkOS/Aulf9pgscwVRIA
	KCj/IzRGNd6L7hGgtcyCDIU7XayU9QDkLNZMOj0tpMyItUHNrn6Lat4h5hNAVNNZ10OKp2dIcpkKj
	ENmrwQ/zNkxY5Wg7RLnzNjkrQJTDiALxcrvgvhXuSwVzRqFiTYEnpV4/P+5Uec/IuMfv4Oa6RoLa+
	dELMnBL7L9TwfTZg4kTRDsC+bkbrkVDKDS6R7fWJmw18Lezp0P7aaCyRum73JhDVDXlEcRODuyFK2
	B4PVpjTP3HQRHNNft1JTmgPZnexjEyyFO1OFjusYRb7LdQmMTB0tKWXX0dVu5cTeJpUfIjFPYntdk
	M4eRI4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg5W-00000006SAT-2hZu;
	Wed, 04 Nov 2026 18:51:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg5S-00000006S7v-2B6L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:51:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9394595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818312; x=1794423112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
        b=dfISi4NFFpU9SUSqkvcjHSJJJlAkpgtjqnSecMs5jygx0WABSt5Q3xLr2PxRJUGTVo
         8cz7NV8HBm/GJMhy3e+XuRJPn2ZeP6Z0Z2AUyqp2qe8HRr7+VoKvEQ8robhZx0CvYEKp
         QAYfkIH4reFQSThE/jWS2WhZQjdET0zc6HxB+Z2CyxPgtfMDgXoI5F89rmRY760VLWkb
         DDKwbsiYjqwZ0tA6zdbg0oPQnTDLLLOxQqvaMj3MFy2lfuGVzPytrzh8Mp2pHty3BBWV
         j9oFgsD1k4crz6y8NqDIYH0KiD8BD4zy3mKPN1qFWT4onnAYD9Y16hOL4fEOBO8YllJn
         +zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818312; x=1794423112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
        b=lsxEpLADGVWIW3kmNCVjfnenp2zSOtFXD/zDLcavnPhHa2hbfk6Q9K9WQlfiphvPZO
         gk/IwoEzMdBgxmfGhbKJ5MAOVazVNndgXgKTbQpQjX8HgXv+XYLFp9oLpO2DKzyKRzDd
         oGdvFXKSPA5svowehJ1t7qLjluk3klh+AE038rUNxUg+LDv6GdtxcIe2xeS/u3z1W1Az
         q3jZhFwkivRjhQXhyAr2mak6ZCJN1dLrvfGNp7K6kV+3kW+zjSlsshS4Iq3GoTVdLhGZ
         gDdX0zGRochyf+A/FOR2XGEbZb72zv6VcAkG+/LPRCFyHkbmFfsqZxAdJaTPqz9JMlqg
         zCpA==
X-Forwarded-Encrypted: i=1; AKwUvBwZaZXsyw0V8LKC1cQhPOkzKSCNAj9h0olf5zZo7qzic7iD6uPDyIAIR0mOdSKQzWVWD7rVTxOyV4eIfEExbDI5@lists.infradead.org
X-Gm-Message-State: APuU4Z+cO7i9e3AuMnv87RtOtU+yBxYRFkcCTkKDqTVxFg+aRDDw6Lix
	PHBXsHbfw3qzN9MKuEI+pLc5JL+n1gNLa+/TiRBTjtebI/gJ29640YAj
X-Gm-Gg: AYBFou06zGA0VFWPQt+wqAXrjXuAnKJFLVbZq+gcKPmKY3ZmxrL/30/D0fw3YXTPc3F
	usC/x/X1xi/rrM6VZc/MGU8fPT74V8NCEYtPiSIZ9QYWRYdEhprs/Hn7vTDUMbMeqHczoT+tcSd
	24cs1uPNFZJznlNF+WFWWdDspUt4LGbqN25mtlU8HfghLKKfxBf4cVdC2T+HNHzFDArWGPIbjxs
	DlRsDNl5RRPk6b8gfUIh7gorghqMH4/qKqnE6cSblBBNPamtpJAZCDDhR2ZfL27TPufFBq6QL84
	/8nkB+leF9xJN6hRpGVSJdwXE2yu5tHx1EXqTqNnjgwerqh5MG4M6vJNPyqK8wLhugEkYthxFAb
	TFS4cgp5yftrAdXV4lzyd5y8cQPYsqElvUs31qIBhcXMmiDFoIu6kAWyC+jMXNJAAnH/RetJUhF
	WSfsrnqOy9P48BP5Zsd8Xpf9QoI77Yi40vw1oENbaVtXJl4nnsFpPClTDzz58zfNjMu5It/HPv1
	XT9vw04towZ/o4AfRzq0+/f3PlLR8oeT11at+T1ugvqCQSYMnnXiQH7UxEUfsTI5YVe4eM8LPXc
	tA9ihvlEMdpXJWp7xSM9we/2C+6D7ElJJ6H2nrZSk5s6TL8xzzctKrsS3JAdF6GxcQzx6CoGvpj
	iv9ve5BYZ6yylhJ27krE2r6ndRHH0cS0vieCwC/J5DOerv1mJ1Vng0j+V9OlYsxHWnNQ/6XpX7x
	uP5+TuE4xV0Tv69lUkN3TKUB9ZG2mzQeA+UVfoVcRVC0LLw0FiJ8zZeviNsI1RMSgT4Imld0LL/
	Wmj3+8Ty2RWOnJvL0brqMFQ7/ARh5f1WegCbrIAPakP
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ac17471285mr378898355e9.7.1793818312397;
        Wed, 04 Nov 2026 10:51:52 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm4031515e9.7.2026.11.04.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:51:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] ARM: dts: sun8i: r40: bananapi-m2-ultra: Limit eMMC clock to 37.5 MHz
Date: Wed,  4 Nov 2026 19:51:48 +0100
Message-ID: <20261104185148.883318-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105154_581241_3A9118EB 
X-CRM114-Status: GOOD (  11.34  )
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

The Samsung eMMC on Banana Pi M2 Ultra fails with "data error, sending
stop command" within a second of sustained reads in DDR52 mode at
50 MHz. At 37.5 MHz the same board survives a long read/write soak.

Limit the eMMC clock to 37.5 MHz. Also enable the hardware reset line,
which is routed to the controller (PC24), so the card can be recovered
after such errors.

Link: https://forum.libreelec.tv/thread/30663-banana-pi-m2u-emmc-data-error-sending-stop-command-fixed-with-a-40-mhz-device-tr/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
index cd2351acc32f..ddb70af25836 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
@@ -195,6 +195,8 @@ &mmc2 {
 	vmmc-supply = <&reg_dcdc1>;
 	vqmmc-supply = <&reg_dcdc1>;
 	bus-width = <8>;
+	max-frequency = <37500000>;
+	cap-mmc-hw-reset;
 	non-removable;
 	status = "okay";
 };

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


