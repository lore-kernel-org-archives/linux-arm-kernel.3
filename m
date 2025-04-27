Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53AEC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l+/h+HUw5Fa9i+auYLXdmFTVTqLMJ8IF6VQixN6G/8c=; b=Brfa2IDExVJGF4WXUCKdi1YnMI
	EAnR3IZoUu8Y6sufT3uynt6RbrxEWuEboiponlGpKnsY+AxzTlkrZKJ+QqU0hgU8G+bAQAvYl1cmy
	qhqY+Ta5NtVyVLdM+D5hGTqiBm6seGqMGt2aAiP5weDL57DhjdTpcdrRgu+tTTC2+7CG1OLCmigtc
	B06VrEujlsKxpdvBA0pCYE99VksYkv1+ZAuG7F0pu5Gu1Sn/1fbSjthEqByNwbGYjtgC7foHcWylM
	I1tUczMxEwdWsF42gjoxGccrLM/IC9CKskEjZnYl80LXlg2hJsqpbGgvd5qQ7dapz5keQ/SFwOiL1
	QliFQt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92yQ-00000003f1G-3kaX;
	Sun, 27 Apr 2025 14:27:14 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92wU-00000003eh5-1uxG;
	Sun, 27 Apr 2025 14:25:15 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30bfed67e08so41393871fa.2;
        Sun, 27 Apr 2025 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763912; x=1746368712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+/h+HUw5Fa9i+auYLXdmFTVTqLMJ8IF6VQixN6G/8c=;
        b=jsYcWkkbCZEwiUHeA9vUCMZr0NlcnJE4huDeSR4mShYIQk57G3Iy+3vUL4TJlInGzm
         a0VCbmoxouiv2tg3Gr4TAFJ3cgPecipywTvrzIx1O6bHJjfhNusAHJSEmwGxUG6QP6+R
         R5WuAu2B6GM5jkACnA8PbuxD46MiBzHx+3Fr/T5SP0NetPOq3MkJI13nRVfc7HOQko7Z
         RY722rlwmH4Usruy1vL7PSNCPQUEjY0Um81eiDA+dbSIqF0EVpvjdF1T55C9QN6a5qLR
         G7aj0mv2UdyMBWdsn4iNZq4X98Fwf/BN1hQmhBD3D10G6mtYkiWH7EaHNyn8CuDogWe4
         qXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763912; x=1746368712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+/h+HUw5Fa9i+auYLXdmFTVTqLMJ8IF6VQixN6G/8c=;
        b=Yek1o99HWfMtnspTeg5Db76MpCpc/vdmfa7sHEFs42O7W3ugHZeTtYVfYmRzERodnD
         JvSX6iQLGIpda70zwnm7WuAVVgI0uZqtLfV2/MuMDani1i0oKYIH2onvxv4seXJBqYEq
         y8t2PghT7oqQvSzHNb8ZbG1xFvTk3+wG6d1wu1PrzoNepjmGvh7QZZSuhOdsIsIevH8h
         ax+x0UcRM5gVfMxCdxS3lzRwrgee6reNIgjZa25Ha2vEdK92K6jmO3/5P6Pg/oM4iEEK
         Boq5mXZUZF9+qBlY7XkzP5Ghlk6U7ktSN23cGK4InQPkkUeed40yVj+EX+D4Qu27k7RG
         Z+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUrSEbevPQibGaapoaVVyD9KzSmawJNjRfr+0tsHw8MbK0J9Mq294w6hcGO2n+t/Wf9eytjP7V4hpe1XnU=@lists.infradead.org, AJvYcCWyGEat7yu2r2zgYmjFe/9GjN/mifcohUL62MrXyItd9Xe2wqC5xXbZItWB3uJBG1LVOTwBBiY1du3vRa3kh7/3@lists.infradead.org
X-Gm-Message-State: AOJu0YxssJEHw3ogvjPgAstrWu2g/5JDoP11iVDP9k+BWnV+vclk4HQR
	9+Up5ncWo5xEaVLI+QrKT5ELKEGmBBGqviJ6YsNWCQ091Fqc9ak=
X-Gm-Gg: ASbGnctmdUYEO75z+qOG6jdt1R1SQkqjDXt98yhJk851rvLWTic13OymfZmvD58W1cq
	4NMFjmBqLoTjPHEVXDyw4aEjiYcbd/6vQGHxWzaWSGN8lPWlQe045fKKycXDREIRjVR2Qr3jUdO
	fJJrOQYx/XXdvY15spbYEF7oBAeqYve+AVozDtyJKeSJojJsy0FuivGNaIzEPJwxEFYhx+FWqxI
	GI1JYT5HqDIjLB8Ek0gTK29mjPM5K5Z2W1qy/p9iAKkgO1OMR+h5+dadEXirtSpy6H62y+nfJZh
	T7upx8S4w4cZpJQXtBcC23XY6ewOoAkeYVTmYxRVOdS6yswwfUjd427t
X-Google-Smtp-Source: AGHT+IEZEKc9Vnf/efSmBJgLhw4tTfU2F09GmxdHClCejQ/XhLFf9brnK906waqbWQ74zPb6LP0ysg==
X-Received: by 2002:a05:651c:158c:b0:30b:cd68:b68d with SMTP id 38308e7fff4ca-319dc02035cmr14537211fa.10.1745763911951;
        Sun, 27 Apr 2025 07:25:11 -0700 (PDT)
Received: from localhost.localdomain ([178.176.177.108])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb482b1sm17659191fa.29.2025.04.27.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:25:11 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Sun, 27 Apr 2025 17:24:52 +0300
Message-Id: <20250427142500.151925-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_072514_496425_E8C9FF8E 
X-CRM114-Status: GOOD (  11.80  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

v9:
 - fix a remark in the driver
 - fix dt-bindings
 - rename apb0 -> apb

v10:
 - fix a remark in the driver
 - fix compile driver for 6.12-rc2

v11:
 - fix a remark in the driver
 - fix compile driver for 6.14.0-rc2

v12:
 - fix a remark in the driver
 - fix a remark in the dt-bindings
 - check driver build on 6.15.0-rc3

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 379 ++++++++++++++++++
 5 files changed, 486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


