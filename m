Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFD2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FzZTN8nr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARheZ/LA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=; b=FzZTN8nrK5wEQj
	zqchy8/G9SddExM0FG/IWJaxvQZn30NnzJx86SCZPn33fAeC+gfAEV/KVejb1smJNd4r+TaCVePGS
	n3hMAWzaf4qzNPZFEFpeU6nksYL4GgWwOH2KOyNUuoDFEnEmJlekISeJ61S5Uu76epT95KPa/Pywe
	JvasdmC1eJS3PvC9TlA3ch3b/lNMCSjDgCMQYcOLgjPGJkvcRLn/kfRPw9NlCQ1KtZe48Bk9BMUxZ
	s/0eR61z8o6C+zMOSnOGMSsS5fDjuSEu2+ohwq5wuxedPcQEDRa/4hcuZrVGJZwYYT6vZwyR4WhPp
	Y8QhhmZQCxdoBwIOvWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Ry-0000000Ad04-0emy;
	Thu, 05 Nov 2026 20:52:46 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rn-0000000Acnt-3TMd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:37 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6f8a519e215so1204966eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911955; x=1794516755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=ARheZ/LA79XLyx8kfHo3C78M1T+7r1/74VWr2Pi6B3PcLcS4TC2y5wCmQWvdKrC7hc
         0t4h4OxkgAHjokDx149qr/nY5vnN83l6M8jG6Gkd0/oWfawhFDF/8+/THCG4FkpHRXZ5
         +zzPHDeT7+HSiW0gquMgsSuJvDiyyhvtFSJnKAVk/UPR1VcbXaIsfypgzP5eBy30fVrS
         ZXV82WPL10tCPah9i7DGibt1ajQNX8CG/11sNdGUdd+7LpMp4iY5CgRChm8ZcPmwwzGk
         r0sjBZKReubjfsI3oYwdTM30Ut2BVkSwgvYebMRfx1L2BhzJyAHGzrr2+iONxLVC/ImF
         CUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911955; x=1794516755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=gU+6StMzl5400aAAwLwL5098woD9tngfR7jBZQJSgMhM2mqSZ8mGONVhMtBjXAm/+u
         +E+YjReunJxzFILOIuOwiR39DY3iaVw/lnTqVFTmoRftBF7PCdmffgiRhNNLmqWAJsra
         0Brfe6Nbf7x/t5MLEy1Xo5YLSoGT+3eJKa+OScFBvqmg74Kdky4QON+lhFRnH96ojfbs
         DNmWKXtd4V0VTlk1kQrzCequxlQFM3XrxkE7hsAuJUGur5Dk1UKhytCPOXCJWlb1D8e1
         eaasJ2GuTUT8VGLOBNo2nsDne9Ov3nq02P9nIP5BElrD1JMD0mq0cgKLjAXhiau9y6U7
         AuEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0HvUqD7Q6MrdLBxDVQY5FxJQo3b7bISakvogLqG4qi4Qz+gL89vwfVco+hTubiQt/GdgPvTw44j5RYyEfx/AK@lists.infradead.org
X-Gm-Message-State: APuU4Z9B1orFHtJPwMdEI/ApSJGPLIauCf+fwRHaclX9+yogZ8ZQoMyf
	/1AOdGdHoS65YLZL0M5clZLNiEIw791+qHetXc4li/1b0+wWTc1IOq2e6WEgAg==
X-Gm-Gg: AYBFou329RdN3JVGdwUevuQFUeP87kSIoZVf/29pJsuJlbfPhYJ1PwStip04Cp8FNiW
	Li37yzuKiM9TqCPIUOeSUnDOhKVrqxZmDMrEgCoHF7Z7suJPQqonePZE6foZ269Nztj2uhDUER9
	a4/fH+rlUf8nDJSeQcNruPlwR1F5W3DGlgagaiVLY52odgZVuKVsgmFxoyBjJ+8STm4dp7cscEt
	PuKcx6tDXIDo2mJjpleAW5ZOr0LZ0o/JjwltDZiH9VCEdQ9zzxRvoI0rgnwArzPvLcITmuJtm/C
	0pD0ThpdRQJ52kmpNQNWgH2Az8w+eBj1Dq0frBHkYW+FH5q0eJ51jlK8YeUQm9fuoertP5tZHCZ
	/WOaBd6akyODRMhBFYde8EZfAJ6P0vF4jqMppeHO2G79xexocpe5Gawt57kRWq4WaI5VSI02T74
	0j6NB5sPoXZrf71nYaLePuXrN6VdacYpUrTFLfa8i/KeQnysSAUpzmfzLr6130JpMpXAUZcu6OA
	8BlW3Z4KGNiX3WbcKSi0/iX661ej919V5CGhL/OMYHi8S5xQY8KONDSL+dI5fGAjyYAIK3PC+cc
	bEXWEw1LZgfUqQX5PZfMjichHJnpDPzTr6dOyOs+1+PYzoDt0cJZW7053NxRntEYYyiQLmprlGF
	Wvv6eVHx+hPG3kdBO98wDfFxHI2sUlFaCViog6QcA++7JhYIRgbWg1hip3rFIeestzaRMZn/y0G
	B6+hConx4sQQ+VTHxzxePEc5rQmnV5GAuIsFiZSCL7DAqIGJqaHDQef1iwhfdUJVDLHeAnJmaQ
X-Received: by 2002:a05:6820:995:b0:6dd:c600:ec2e with SMTP id 006d021491bc7-716d20ba2a8mr2263018eaf.19.1793911954642;
        Thu, 05 Nov 2026 12:52:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:12 -0700
Subject: [PATCH v8 11/11] serial: 8250_dw: configure RX trigger thresholds
 for Octeon
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-11-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_125235_945284_A0AAF1AD 
X-CRM114-Status: GOOD (  14.84  )
X-Spam-Score: -1.9 (-)
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

Octeon uses the DesignWare receive-trigger mapping with a 64-byte FIFO,
giving thresholds of 1, 16, 32 and 62 bytes. Its setup bypasses
dw8250_setup_port(), so it does not install the common trigger callbacks.
PORT_OCTEON also has no static trigger table, so rx_trig_bytes is not
exposed.

Supply the fixed depth from platform data when firmware has not provided
one and initialize the common trigger table before port registration.
This makes rx_trig_bytes available while preserving the Octeon port type
and register accessors.

Select DMA before filling in the default depth, as before when the 8250
core supplied that default during registration. Thus the new trigger
setup preserves which ports attach DMA and their existing burst sizes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 257baab5a3ed..31045128dcc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,21 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_octeon_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	int ret;
+
+	/* Preserve DMA selection before supplying the fixed FIFO depth */
+	ret = dw8250_setup_dma(p);
+	if (ret)
+		return ret;
+
+	p->fifosize = p->fifosize ?: data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -934,8 +949,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
+	.fifo_size = 64,
 	.quirks = DW_UART_QUIRK_OCTEON,
-	.setup = dw8250_setup_dma,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0


