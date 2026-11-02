Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3943D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=10TJ6y+7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=htKvuHMj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=; b=10TJ6y+7zcwsMU
	7E+TvDZiPlzVWfYBVF5CJRy1rwdGw2+7/NqV8pf8s/fx60qw8E6LiOGVWUe3iIfO/w6GcHaLUE1ge
	zg+nQgJQaU/PKjQQoSjuWdtzsUNnBIhSkOM7M8ck0rv4RHZ5bAKYdH2AgQaZlu1y/alOlMjsNAxI9
	e1v5GYt7rR9ja+UaINsSJQql7fSSK1smdWbIIpdGpJs0dk9YGspAdoXc9zx9zSWz5NuG1wRV8sKOB
	EQGLOyVSC6xtEDIx9cp1ChnpzuKJN6yHOD7lfN2ju0BP6qLP4ykq2hiybJ6z/6H0Cl6K71PYMKgf3
	Jvl16nNtKQYZYGZrlEdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0t-0000000FvkP-1llG;
	Mon, 02 Nov 2026 09:07:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0q-0000000FvcI-0VP1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so17781755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610450; x=1794215250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=;
        b=htKvuHMjoltiR/jjjD/n7mirrGSX7BCGzZfFmCQf4+RstWJ5qA1V4YPM5dborD56ky
         aw7Z2VF4qYggY2I7+IF7/ynGc+4v5D6azupyYN3SMgojCrH7t4yn/ReC7AsrhFQfchvR
         oHikOhH+dMt6SJuWzyI+YVHh7EFPAsAq4JapY7GMfJenQSMKAhLIjsEleSCzi0T0VQZx
         9nrJ5xtYhLU93QcUcR45NeUj0iV3uJphd7cm9B8jNCYpgpZZtWzBtwSDcajo807ElFos
         pjSv+M77YqbZ7eB5SLthNvlMe9QkofHCcZpeHyWHp9reRNnQTU1x+xbbkb0JjghkbFM3
         AJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610450; x=1794215250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=;
        b=i2ZlNjvKZvlTnionhtJXt3edkFM6i5Xu7P3kuzGkSY0+72+MJOL8JG6dtI7+RTtffc
         D79qs3CnAaBvvhQTFRiBE6d7kiez/HeQM1FKpZBwTFtYj1Mqa2sGOZeB44O9NlsHID+Z
         b/ImztpR9Jt70TmaBdBmA2XDuqg6tfItL7QSDrqLPM23pMAtZPRPPQlJVjL4hkTgF6p6
         v2JG4z4yPDnO9o4b7a9KZMQt9OQWVuaGJZE7UyM2r/l1sjq6M4EMpQhyf6/hgn6bNgLz
         Jz3MS2R8iHpASLWV83Q1B0N0KmiUyBDLE9EbudLD4F/zqs3RHGQZdE64+joKj+maoF+p
         1etQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYPXnUGCxfKAxygR7K/edxE9CHuvW0P81Xvo8oVYvbeNtIGDA3Kbc9USI5LXSzXp0La4h/GgttlI2GR8Rgi+Iq@lists.infradead.org
X-Gm-Message-State: AFq9FYIVZmgsvvhXrHUR7N1JLZPfs6w0tMa4dRhCX2r43u/jSy5GaKSF
	NkoPCqi8RSA3ldCDAid5/FLruYCw/9vTjsyXZA6/FVhnY4FwYxK2ymk8
X-Gm-Gg: AYBFou1iHXyAIT1flRTCrGG4bx9yNrscwWqhWA/F8AnEtG+sDHM02VkNUjJI+8VPXGn
	uJ5i5iuU+b4r7vBDHDMWR4cQczlWvfGj+yd1XPw0b5158bmgz8lxku3KF6a+BcDR1Bzz03vxOI9
	b6ZFjDEYO64eLTLVuxdgot4W1gIzH8gYCbvvmvo7/RKR+MJODABfjOMaDrNkTXOCe8Oj8y92cs1
	/KLakRZjAGOQxj5Ndlco8O5+YDqWkMbqBeCKcH7AALnzjLPqEAyPGq7NpGc2As/1Ve51ee4YwtJ
	vleAFgsLgppX5Dqm1fhFxr/bQnXPVMN6USHT8/o/sls0Vudutzm1i84o76iewQYtagsdUK2YGew
	MVfoVeQRdfB/AKPVeHAEvDuWGZi7iJRg54cRAN55N+Nz9cEOU81KsXeFJPdJp0OqPsmq7oNnncK
	6rwJRA2oVrq+Jk8djLVOUW7wUKTjtVW44h+L1xOY0aOmZF1ttdFem/lPbo/gaJX8liXhv05U5XY
	ae9WhRVEe060hPQwItHieXbwEM75+VzhSU3Z6eEzDSMrmMD88Btv2kmUb9uAcYhK9ZOLaNc6Sgf
	+oxG8b09C7/NiTJTgLvLTDWOjyBiAMVOBXVWZVeTg6q+Pjuw5b72V3Qf/YtR0MUnNF6WcrNrC6z
	HHEdN3rHlfcRGAw+prL4fJExAaNTgSzXJr5XJ9HzR7wVaAYSvtQf/azAfW5hh5F0i8rxqC4UEyz
	buEqeV22bGJN34
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr192107805e9.29.1793610450362;
        Mon, 02 Nov 2026 01:07:30 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:29 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 7/9] ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
Date: Mon,  2 Nov 2026 09:06:57 +0000
Message-ID: <20261102090713.896324-8-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010732_257285_B4545D3F 
X-CRM114-Status: GOOD (  12.06  )
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

Enable the dma40 controller on the Raspberry Pi 4, ch 11
is reserved for the VPU firmware for VCHIQ communication,
and add the DMA channels for HDMI audio.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 1eb6406449d19..a49a732d3f64e 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -42,6 +42,12 @@ i2c0_1: i2c@1 {
 	};
 };
 
+&dma40 {
+	/* The VPU firmware uses DMA channel 11 for VCHIQ */
+	brcm,dma-channel-mask = <0x7000>;
+	status = "okay";
+};
+
 &firmware {
 	expgpio: gpio {
 		compatible = "raspberrypi,firmware-gpio";
@@ -59,12 +65,14 @@ reset: reset {
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 10>;
 	wifi-2.4ghz-coexistence;
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 17>;
 	wifi-2.4ghz-coexistence;
 };
 
-- 
2.56.0


