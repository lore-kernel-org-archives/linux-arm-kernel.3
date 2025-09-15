Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D535ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 01:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=; b=CUk5JQAIWp+4dT
	c5zfa9QBd3WeYzWVQS6iS2XrQ9c10IOMKB752I6eZctIJNODTlfx3M4+jMI0mo2GtK9lnnWDQ3z6U
	fh3ykdW4HEDGEGrI468qqzcBFsvoqLEspoKFhwS4f4uphDuBRL5dh2tglFT/g5EA1mRDUywgTKiCP
	OpqpyIpTv3N94+7HXtRow+b3CCczzEPu2UvLAq4mJ2186v8AzQ/aIWJLdCEFoBJIE28PFhbg6VnnD
	C18Cfi340cegJHriIZ5WngDIT2dMBb0XbAom8lOZRBwWIspAAbP5ZSZUp+fXVkaFtdgTFyUTPcMbr
	1rqtk7DSBnbkA8S7AATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyOm-00000002VUD-0AfE;
	Mon, 15 Sep 2025 01:52:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyOi-00000002VTO-3q46
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 01:52:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2445806df50so28403935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 18:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901172; x=1758505972; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=;
        b=MzxxlmQMHzwEwrzYRDXv1z/+53pd4WmwNDuxHbY61iQuK4nA5NPLDW8igxK2a9pY/g
         IVh2SpC+ugMb4xJnprENAYJ4d9Q/OJriHumdsxohimGve3DIjf9vVgr+cWPikswtoaVO
         KDvWKJSZD21qwpPsYBGUYG/fkQTkU61tm61FV9dEziej66uMc+gHS3OUVrmcHIFx89dL
         x5NOfLP5OV3WfGw9v2cA8eShEpDMnpNFmAm2hJQ3rnVlGWvSLTWz/o3QJTeBhR2I9dNa
         YZ57Wu2sgUNPyqyeze2wwDs2xNSsSTz+bxpgCKShkdakDo569yxz2fmEDCBboUTfLQVn
         ysBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901172; x=1758505972;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=;
        b=VvRygaDSPB/2Tw73GoIMP/nAhj49C8jJ0b4ezzXxlroshEZxBXpxeqz2FrWgB9RdRE
         /N7Ec7Mh5ZqXZinv5RyTu8XHs5cNv4IfUMgLK3KqMr2pj4skklazSncb2XdsX515a85v
         yeSzdEP5yr8N/V23fsrdMLPZzik4kwcgswY5xwNRPLSGo5Sba2NJUmu9Z19oewOMrA1R
         LXSlfTMATTKpUM1I3aij72+3GpE7bsPk6zkNx4Zi+5LNkjNI7D+QGanjxXa2AcZVPSSk
         YF7YCOM6JUBcWNJAghzSky3PwXxgm8vEWWboyCFInPk65dfVNxwCzVC2zXWb+amJdwMA
         QDQA==
X-Forwarded-Encrypted: i=1; AJvYcCVnErAmk6rPOllvK9SgM48G3LsF9fpxIMhrsP2x71Kgz5MfJ+2Y8iyPLFyhAHOMj9hJ7fECtGWCcu1AOYLassfG@lists.infradead.org
X-Gm-Message-State: AOJu0YyxCz+zgwzsF/DUzX4C4/PWIASXHJHw+N8MTmWfRiXx6c4wrxJ8
	WpCUuKrGNbIk9tO+HfjaoQyIscTalOGtrPslxsPyTt3067Gifz7W3cgkm7RdqFmodRM=
X-Gm-Gg: ASbGnctiPQqfbUCJ6ArxL9aguVxgmID/vGeyrvJPqM0hxxf7+2UQlFXezgO06YrnWw8
	OrvvaDWkvXH+Symhl0PjA1l6Q9lGYv52YQqcjCk9XNcRk35jAEYsidO8hF7HWBF+gVlRP+dubAC
	UDQaLvIP1wmpQ97tQERPIEK6ZkwivvJ5dgvWoDkMq4xrvKdXVynxFCArC1gfx49v2EHecZ6oQFa
	VTVoIy+5sIkmLOqkdG46y1EIklcuZYmka1ipNyvPJnv/KTTc1s3d63KKqoVkDT2jc/BuEXCg53T
	JdTSkzpydxpJRhln1y3uWyqhmK22p5zTCiVUHP6iFvTOweANWgI3TfAr8jYK5Utq1R3T3iMXjXd
	LTeubXdnAsJ0rjA2l7pgkBVm8
X-Google-Smtp-Source: AGHT+IHSOwGuo1mjiMMrQl+gIqoo7GvpRSlfzpkOluezFbkbqTJG+XOx1NJf2/A3WdLWc5HVCdLdHQ==
X-Received: by 2002:a17:902:cecf:b0:254:70cb:5b36 with SMTP id d9443c01a7336-25d23d1c98cmr116237135ad.8.1757901172208;
        Sun, 14 Sep 2025 18:52:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-262df893ec5sm41565255ad.46.2025.09.14.18.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:52:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 0/3] SPMI dt-bindings and nodes for Apple A11 and T2
 SoCs
Date: Mon, 15 Sep 2025 09:52:23 +0800
Message-Id: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdxx2gC/12Qy27DIBBFf8ViXSqGhw1Z9T+qLAYYEqQ6TsCxW
 kX595J4UafLO6NzRndurFLJVNmuu7FCS655OrWg3zoWjng6EM+xZSaFNMLIgc9WgOH1PGZulfV
 eu6g0EmvAuVDK30/Z577lY67zVH6e7gUe01XTC7fVLMAF9yoYg1GAdvBxGDF/vYdpZA/NIv9QC
 /CCyoaidIAhiah79x9VG1S+XlUNNdaDIZLBSrNF72ubQpdr+8i8VmIeK/G2H/O865x1Aa1RMRI
 ljFpbH5MfBgBQCZMLQVvhVN9k918eiBEbZgEAAA==
X-Change-ID: 20250527-t8015-spmi-838bb49d34ae
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oSreoU6ZmkSN75RCTco6kgjieWSOH7uDaMA8CsUlAvI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3Fw2Xh4uVtqY9Ml3baPpwriRbH0TuZ8jrguv
 9uyYm1R8KuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxcAAKCRABygi3psUI
 JOepEACRT8iHqO/muQPmqp/E7LKM6qRj9SPGrGA0wsqu4Krnpe/CxFRgMejDQYjX8gQ3uG+Rh26
 HBEd9E8O+9uWAf2wqfBNfRVou33KRJBi9jYKlw7jmxIGBd6NDSHtM5pBH/8Xa6oZ0GBnHTsmjM8
 IKHTTT6fARFEnjA2syjuAmexyaOK7Pqp+gaVNWaR6nIIsxuiZW1gwPbFzmJTvIvTjKTpFb1mvQm
 bNSzK7tsQllsS7MQZxWtBTFcsucS2nGjfk5e3knwLMfGjtfiPjKXywreC9Fj2p1Q6WhLW2vbK7N
 uz7q4hZ5G+OQnCuxJj4uocgeYe2rAc6zr4URDbLOebiWEjl8rpGW6oJqsSWwkYCyc3Gtrs/oE0X
 TsyoA5RPiV6nAEAB7m7HJEoJadlFVjlTuoBBN214CKSfyK99ly5k91efF4189+1cKHj/lT+SsPt
 dTwT7f7iI62JbMWgSvpM/esdhS9xYYU9BG0WHiVE4Tc7P30pi2YWFjaHAjc758mKymcyA2KQ7hL
 U6WbIzIK/ZS6UCwmQ+8an9R1taHMKrDW5WQlvt9LgbVPN6QSsxFO6Ia33MNF0s8q65Lo6HpJEav
 zn+hULTxZHzzvbb9dC8yauwXeUeZ1VcEJ07GQQKdJzXl7Pvg/6okcKhgYXzVkq2B+t7sAbrj/Yp
 ufg12isYcMJ5XEw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_185252_955208_74B6E007 
X-CRM114-Status: GOOD (  14.47  )
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

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

The dt-binding patch depends on other spmi dt-binding patches that are
already applied in apple-soc/drivers-6.18, so it is best for it to be
applied through there.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v4:
- Keep the empty lines as is in the spmi dt-bindings file
- Keep DT includes in alphabetical order
- Drop tags for dt-bindings since they are sigificantly different from v2
- Link to v3: https://lore.kernel.org/r/20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com

Changes in v3:
- After discussion with the DT maintainers we agreed not to extend the
  generic compatible[1]. Change the series to the agreed-upon style.
- Now depends on a patch[2] adding the t602x spmi compatible.
- Link to v2: https://lore.kernel.org/r/20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
[2]: https://lore.kernel.org/asahi/20250828-dt-apple-t6020-v1-22-507ba4c4b98e@jannau.net/

Changes in v2:
- Rebased on top of v6.17-rc1
- Collect Rob and Sven's tags
- Link to v1: https://lore.kernel.org/r/20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com

---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 989ca853ddeefad448bdfb771113faf9cc480936
change-id: 20250527-t8015-spmi-838bb49d34ae

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


