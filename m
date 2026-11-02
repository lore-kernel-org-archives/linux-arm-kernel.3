Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBECB606BA55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zbfFlmG9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOdzmKZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=; b=zbfFlmG9o6u/nC
	AYh2EX9CyD9ZFVqBWgVV4NmKMVWN0EVVcVY527ZxcXieGUmzhF1CxU6xNMK0hfvNWb0g8Quw6QLt+
	/bOZahcsKntxWx3lzbyQxgKgXClzs5SCFfRDi9sFOPT6lDxUUl7qU3F9Mkys+/EbiUKGPGOIXj4HA
	HcSlMmt3gMFh5Iajt7xii2SjYw5itRcLYvEHFwcyzCcolsS+o4D8yB6WMSe2uchGeWuNBDXfq/Moc
	ah1y46m4z1Y+TLj9aPIA3dsfwJAQsIiIdJGjxHZYglwuoh/miIXL9c/BgQ6C3/dn8tlG/nRbAIbwb
	tU/ueLy44E6jQThBinZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgq-0000000HQyD-3CVq;
	Mon, 02 Nov 2026 17:19:24 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgn-0000000HQtn-3fKu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:19:23 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-36758ba1f01so1590340eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639961; x=1794244761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=;
        b=HOdzmKZJJjblNfcC/HaSZFaeoZ/X2ZUCkHwNGGDdAtzcAaOiuZ+1nW4hQ8gJDF2bx5
         QZl2S7vq0nhmRfUH1LQdijZVqWIfwwiWzTI6Ne1+fWQqO4kPA8LFgURMkvfJw7SSy+tX
         fl3zUl3D2T3PvbzOrW7YMn8NYTcLxsNaluPUJvRCoQ2NhdI7iu9guDDxjaq8DxPYKon3
         f9UGT9KE8ydQQ4SuQEn+qX0rYPy/AA50gbx+8jRoZYFYJrR6j6YcdbE8C7kP3NqbMV1p
         UY7cTkM3Q1aiCJ8g3fliweinhdFua/r6reubZHX+b/G0mAliVUy/eM+xAMbQjkGBfuxo
         BgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639961; x=1794244761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=;
        b=I8jw2A4nxkWbERea4QtBZ2dNUDbGlaZbhG0eYdxnt+YGT0OzVra8qmGj/86dYap/Cv
         0PlrAlxKQuM3a9vHP6As+fD4blFqMu+hxczkU2vo+aoOF00BdVEMBsh/9BIxpOIWBcZi
         gbGInMW2YXwnRp7kJSfX/JZlNsIpIe6Hy7q+UGnpUCxWR4z6by6a4hE+deCr6d9qj1Cn
         DKGRI65FUadpffDMUthFX7lvmrf94ngNl+/tu4NrobQuJtXg+j43tqXjct/pIygA1RPZ
         oajOO0Jlg2hYAAX0e34RiErP371AP/XJvzFij/8fMs/ugmG1UCq9rdZYu+0UkRu5tufF
         fKYA==
X-Forwarded-Encrypted: i=1; AKwUvByEVzyiRfnnhkITtOqvbPLLpDr9ym/FXbAo3N/pE56flHuNRmMjb6x7tj5pvmO0qioeSLYTcyCf6wft+kuawePw@lists.infradead.org
X-Gm-Message-State: APuU4Z8mHUq0TJxKh9e6IvvCDtodWOqx5csaQnvpr8wIBWRSV5ttX+5A
	CG1PG8ES5t9gRIn38ggJpy8pUJRKW64oz56kZXTULjYrD84fiiw5Gr8k
X-Gm-Gg: AYBFou3buXDZHqm8AD4sZRZi6koefazY/dIwX1SQRb02uYqGj66rG2ecqJ+zoj9YDW0
	YWSOtwGGiS4Mc2LRtN6G7aNHK7hFI/PTnvtQ516x6d8HoMjPj2oNaepKN4ZxgCzUtsFodK6uhSq
	v1Iuw0JWPrnY0QAc3i5yXg7MZ5SqooIbfRF9RXnx8bqMWNFmtPbeaeAiUw7QhKo0Ewyfdgn3NLI
	wDNYeIeG8FeMwU/J90VHPk2LaICp8bYlaPGQjeB+E025ZPxIG3NaMcmwomQOLIV4qke3T0awsaM
	U9NiKzIlWkQ9MqMWjmXrrcFLL31NkSvGhE8Yn3/PI5BTcUpETFvHmAn00jOS4kN8W7z3RvY+B53
	88pY409yTKTP53xdMeu+5olHQLQ0kVESIx8M6K1DhVNfmth3J2fPIsADqMhzVcUksA5YI+xEZfQ
	dOEg7UZdC9mT0luRv4e7tcKMaxB1O/Hu7xEa/8/D02zU4etxJ/sTq5zVV6HwZdqe2AyDVHFY7Y0
	35acFqFJwh9d5EVQ4uXlBz1plpEZ4t0NtkpuFv+qmy1J4Ea5xj1XrtgWdESFRCx0QOWO0SacGmn
	nwRc6Q4JWjpw+0iZWEvBstFXZBQ=
X-Received: by 2002:a05:7300:c00f:10b0:36a:1470:da0e with SMTP id 5a478bee46e88-36a423bececmr19525473eec.29.1793639960809;
        Mon, 02 Nov 2026 09:19:20 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:20 -0800 (PST)
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
Subject: [PATCH v2 6/6] arm64: dts: rockchip: fix modem power supply on Photonicat
Date: Tue,  3 Nov 2026 01:18:38 +0800
Message-ID: <20261102171838.2958552-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_091921_913671_D6545C18 
X-CRM114-Status: GOOD (  14.29  )
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The vcc3v4_rf regulator supplies the M.2 B-Key 5G modem. It was
incorrectly modeled as being supplied by vccin_5v (the external DC
input). As a result, the modem loses power when the board runs on
battery.

Per the schematic, VCC3V4_RF is actually derived from VCC_SYSON (the
main system power rail after the power switch) via a ferrite bead
(B1). Change the vin-supply of vcc3v4_rf to vcc_syson to match the
hardware topology. This ensures the modem remains powered in both DC
and battery modes.

Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 11ac78acca3be..02d445d7968fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -177,7 +177,7 @@ vcc3v4_rf: regulator-vcc3v4-rf {
 		regulator-name = "vcc3v4_rf";
 		regulator-min-microvolt = <3400000>;
 		regulator-max-microvolt = <3400000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&vcc_syson>;
 	};
 
 	vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
-- 
2.47.3


