Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65551606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NeH/GqVF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UTkjuBz1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=; b=NeH/GqVFwmCPPU
	ioePC033nA1dr1oTczGyAVCo6EdDfqFndFkQrtiwg73HqNw3vcTcwx3SnaQF74Gzr34uX1S9l7OyG
	bx1slIbVXm3+T3339PRSNHsTyZPI1ChoDu3yExHmsUzarbw6epEqGjdAdAGq38giMCOGqCAa33zfL
	VVcNZRSk+crwYZDY5Li3ddSmkDr8O409+NzOYgT7qSVnnxGYIlGwrMNu9/bA6Ajh0OVEA8ElTPK8r
	SymIFEsgd8D29oUmKof3JNySlKs/losO71CxP9v35WrbSDDjWBpMF6u+nVcl3n7MDjRkTR5YN+8I3
	CxvNvhbRIRWvhKxg/YnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEy-00000003jfG-2cnd;
	Tue, 03 Nov 2026 21:40:24 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEt-00000003jYm-0Yq2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:20 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-4f14642adb4so43467b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742018; x=1794346818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
        b=UTkjuBz14OePaiUrkyoMl0vfg6e8HwdSlZt6TExhXuX7uB9/jQzXeRbP8XSjfo+C6I
         avKdfzF2y/NGtd4aYGzKxrkfspK/FqGgMIU2GTvcF/gGo7s3qSgU6cdGUqFNJTt45OIG
         tyJT2J9FdMeuplpl98SZMCjDQRizTe4oqC8FDsm3WeVX+zfW8OqLT5Ug08BnXHde+/53
         ZyBbwt9Omkh5A4eCZ7PF17o6hjK5PgD7MSYxKRoEG8FWKYIPJDgb+Sk9qxb5AycAsmgX
         68byhrUhZQoNFXSicjHzQ04S75pIQtB8Y/h3AOD5mL5NAeoMbwKuhpvtWnlgTcCGg/Ty
         5eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742018; x=1794346818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
        b=jsuxqYX9l0bYWerB6CcWvrhrmAPS3GrxEY1z+Y5vau5+B6+owZhywFdCGcyuz0zGPn
         eT7BhkDoF5/7BHhnFVeP2OagdZ0EhgDp3HbT76GyMTiYO0KzXhhjTHZ7ysgGvpHZ9AIw
         UmrftnJ3x+LOkWxaT6pBniSh2eWU7i5Jsq30jFREB9t0deoPWHi/m7QGaDRpmnS9o5y2
         d3ZQWx+tJ/J6V74xG512weYlyBziiLaBpuoyanxXUn2PSzNT1v+kT/uxupDoRU8izuD2
         53vJml3bVB6VSBI1zRdX5+MP2cPHwHOTSeSvE640WJun0iyEpwK9kkdV/7ZR7RcDyRb8
         l1dA==
X-Forwarded-Encrypted: i=1; AKwUvByW0935psiM8Gtv1Iexzgj7lZRH5/0vRClCWIESNW5Ndr8opibqlGVD0B42ePgJHTqz3TvtI4IfbxC2Zw5vBpfA@lists.infradead.org
X-Gm-Message-State: APuU4Z++jte+ILLDCIcNmXd857x5iRFgW0bpYX+s5EaRKF3rbg7FuBNB
	B9XUNEsxTYiUrQ0EQ+Wd4trF2eLCAjOKF184iE92M9F3fMplQF6dC/xg
X-Gm-Gg: AYBFou0mKb8MsBMMkI3ILUCtotzQsKlG0juozqaRNw7RMqoAgwH996QugDN2q+p+9wE
	z6KxZh7T0hiaWvipxU+NNFZNeWBGeIkzwMXWDCWWk6Vmp0O/Cu3mumcx4Y2XYGNip9nZz4ZND5V
	vfVA5RHErSWHRq2fVyoNjlbpQEqnkcqmsRpTm1sTG/cXntN5NkeDZBcTBPX68jDfGE9PajPHSwT
	bSqVDes4+rqd73cbcMzKOsdDsM7kNfoiKLKRppVd1je8jCldGx3y3sqYH12MNur2ZcOtcQH7BRM
	QlZONCfIkPTKbCBuHwmKwFfP6/byhzzMVBjxnlU/Wl41v4Oi7ai2bcCi2rCxHvr1Uf4MQE2IWpO
	DQaHFEQRcDu0pYztvW4h9OXQWmH26iwKhTGArD9516UblCtWTkFTVt+gjnI0WukwMJuR08OUOzg
	/RnIkDxqdjRwqPgqisTEPDu44daBXYWVSVKm+AqK8H6dTh21QbPfRSHP5PMZ5uX1Tpbw6oTmOtP
	Z80i+m7fVW3X/jX0oON0EbBFQDWnJKwoYdlN67bTcl42IdWndlROQSHXF84ccxqTVMjnkjrNMxq
	T5cGcumE2L8hPq/MGSNsGmPZ9N9fnyirBV6AtKhs6cEYJ7wr3JSXQvS2uUX+A7Jyuw4TlxBQ9Wb
	bDtQuiY3m1eJDS6vNOfaC2vzD0Z4Tz7+STaAGRsx+rOPYH8UUVzAsKKUYV4BhAhbs0onU0hDc7t
	NDm9FwWnUSyddESxHfFNgfCQ4FIk9sSituFmAJJNcQZ/PxdF4/FUvdYZ3kB2QgSpti153FLgxCB
	Q==
X-Received: by 2002:a05:6808:1997:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-5640e035525mr10789884b6e.59.1793742017956;
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:05 -0700
Subject: [PATCH v7 12/12] serial: 8250_dw: configure RX trigger thresholds
 for Octeon
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-12-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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
X-CRM114-CacheID: sfid-20261103_134019_185735_A5431EAD 
X-CRM114-Status: GOOD (  14.97  )
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
 drivers/tty/serial/8250/8250_dw.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index cdd3a62dfa7e..063441923864 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,22 @@ static int dw8250_setup(struct uart_port *p)
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
+	if (!p->fifosize)
+		p->fifosize = data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -931,8 +947,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
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


