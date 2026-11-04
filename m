Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A217E607E903
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LuO+EzR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uSiFWz3S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=; b=4LuO+EzRSnEPwr
	ZWnbrt/Wr39j9aep26526kHOUevKKEZkv7XFAZDtMMUzkTBGfpuQUzKvo9hRNlc50EJBCSVI2eRun
	L5DLAJ8ggORyekAVIYIgujUtlU/gTQSnSFSh37A6b68n0L0Z/NzpXefexb8UaordEBrESiEO7g86d
	d6D23UD7pAw3j1Vhg63sPuZpptpFo+Ige+kq3PX6QnInUBvSIBKlkp47UfUjTKVgK1it2k3rmbbYN
	xclW7cEYzD5VaElFLcMIp1Feyp4yI1npKN0dWuRXWkhCieGJ0CrisfiG5qcIuDN7IHmWcsjGIULv4
	xiAuPgj2urdfCW+GVZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbn-00000006bF7-3ybU;
	Wed, 04 Nov 2026 19:25:19 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbf-00000006b6W-33ej
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:25:13 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-53aa0802881so516884b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820310; x=1794425110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=uSiFWz3SmQxYuQwJWFmNTBcmn7zrFsbYsypzgKw8k4heijsgZAy+nHJbotDXOrWJOP
         RLP6cnmAbwok2U/kcSEKsRNS9A/sac2aZ7K4gjJ2NmHOf0iVU2a5/2R3LpiC4uzR6Fqn
         yRqennuehxqgwZJKQt6YbuVeRsHjDNFlH9fwTAOdSsGPIOOt0apUlWTA+pNVnX+WXJhG
         YTLxT7CIz1Bd3kbf+rWP0L2tckWXkhkLahZFnXInU8+ui0y9Kn8hroWy9AMPPtJyWLh9
         5Ls50MBLRgJXFo0vMcoJLYPQHHCB8j1hSUuxj9uJbd6blCA+ogpf5cBGpaHPzQPu9W1I
         b+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820310; x=1794425110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=mCj72LwuKuUEI6Hvq8o2qZdBd+rRR61894YBfmnIdM3fWNjNxSn/557YLsgHex1/F3
         2NX13vzQsPzTSrHik2oYZZzIKxvYe7CLe49vg0mOANI7ui8BZgz3zE/z1TTBpE9hS+84
         O/wWuZbduIIMwu3rb0MlHtgGUigdWxLtM15wBy4vMSttJFyzUk8MaYEJR6nrYdYhRkTj
         jV3l0dQhcqO5URxiVWKJx4M5l6tO/mQXeeOWu/efE8x3I5ysS72lCHn0BHE0DZ4+eMAW
         hGm/GD4owVflNp0Y/vAekPEizCE1ifsNiz3I2JE9Na6VJSFKzSoRw3HUzJgN9tAsjpmK
         AEmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1JvxEEQo9Ba6QBEouyB/7qb5yeTU1tZMP+CQyukoSUCZBY4zivmqnIWy2sdxXeNeFb53KWalGzJgldbJeie+s@lists.infradead.org
X-Gm-Message-State: APuU4Z9US8f50WzyU/FtrgFAzrfG5LDu+KKwJIcg6ADiZT3V1K1Dfsjq
	2A8u9A1r31MC49zJCKxNmHehNFtKpnvl2cE1YD86S8v3PcbrR/X0ChMQ
X-Gm-Gg: AYBFou2U+RggOASFjKSeakpW3hUoOljkVaH1BioGW0jCa62LT82jUuKapmx2XfeUrgs
	3cEYsnri2xswuK53GQZqUBO/Xyo7ZyKn7DvFNSqjOaZHsMPKZGztm9al5FNZS1iMkhpGrQo732O
	D/r0uSKjruO1gIFCTnUk8CpFHOFt+d319bT9flaeSKauTogMeB/4HZUX9qbycHaeqjPWlnRRK2L
	JfhA6W/kqJX+LihHRO74rcGV3PGsKCuwd5taWs8THjizCUXUlRy9jWlSNGXMNW3bOSHKFGqD4k6
	iEoJpc3kQ9Y/Ur5FOTJWTdrFLb5S3H24gtHSGkei8MLN/diAW+OoHHpRBgSdxL1b7uX84PSlRnv
	GK3MF4U4sS/AxQMcNTzAWjmZsBp0ujMhEX1D2hJuyrqsromoGutzmXGt7sxyjcMAYKOJsn0nbv6
	NUQWBvFb1KsWh+AvoB7a/T3khIAZ5NEDfBe9Qeo6M9k7CxB/yvrBmILoo9pHibCo9YTxq5s9OZi
	9K8F1X5B3L6F6PTG8zudTJTXgAtsOTadWCE6DVl/EzncPhTFt8AtDEjR/vxx73b2y589DdUv37x
	QExrzCQsNQdS2CXVwToohktgPklXoxaP/oHODN6sIu8IwNcAEQzoyuE4xDnBsFEjoMKjkmPVRWF
	wzINTbRS3Y8QFeJPQz9HqxCLr3xAPViY8Ufm0QKGMSlC7vi+j+yPQBBtNpkHLflPnAmuVthGIXj
	/zNXsUHVG/skaC/AEgskfYrEEJElt+6C/zo2Rps08iZ6eI5yBttOXr
X-Received: by 2002:a05:6808:198e:b0:4d6:9293:9b56 with SMTP id 5614622812f47-5640de2e892mr13003756b6e.62.1793820310505;
        Wed, 04 Nov 2026 11:25:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:55 -0700
Subject: [PATCH v12 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-h616-pwm-v8-v12-5-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_112511_801909_90630289 
X-CRM114-Status: GOOD (  10.81  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b80ae0ac5eed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -947,6 +947,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0


