Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B24CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SKUqexZEitT6bzSaew+b19nnDz+WShkm3n1xJnkdMJs=; b=iduvSp/L+/Mc+lZbbIEaD7zkVy
	61iV7h+cPH/o8MN9HMyz3oP5XdLKqHFemX9xkMoZgJsCqsXUry93GDl0RMhxLIoIXESfoPxqdylER
	MUHhIdZ1CkdeBEZJUz811u/Z1IBEV3Eq2B/2/AnPuWJWBszjy3IrewhfCfInEmDttIbRylHnUbSIv
	C2dIbZultdUpcMvnWVaceojicSjyzpR2dZnUG4skGga/JnH3cDhSXfL2KXbELoDboGqfd9b5IK4QZ
	zxw6y4Xesvu/cM3ZzShaN4LK2oJU6naWkEW7mqSrjgzyxcXwmpx5LihV1BYI6fkgOYbyAWkOWdiTq
	LU582MlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxn2l-00000001Nxj-0YaJ;
	Sun, 14 Sep 2025 13:45:27 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxn2i-00000001NwD-1ChI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:45:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ea3e223ba2so307435f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757857522; x=1758462322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKUqexZEitT6bzSaew+b19nnDz+WShkm3n1xJnkdMJs=;
        b=J2dMxHafqwkA3N/1e1aIDKkxxwWMY70DwETgHXZskbU1CWA7RLA0a8UDuFgIkqrWTV
         bjTa+aqV9VTsmM8pwZQ/4hRYtP/05+EXcLCQ8qA2jLe8Je/sQ4YLZYGdhelwzOi6Nn6d
         GEQZ7HqTsxgyaPhGqbhpCNBcWR7wK34JM4hxYgR+OpuocJyztcuSVUh0CovRBft7qozl
         m9TD46CfGrUuJ7fRefa0kX1/PiP6kCquCAk21YFw1DsJffywrscbtNwfpLj5HqNf1dPv
         FRhKcolygRJkrWxcumnrxwZAwdFaI/sD8lizBukp01qejw5wiZfoPoKiJPRaoOT96cmd
         UT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857522; x=1758462322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKUqexZEitT6bzSaew+b19nnDz+WShkm3n1xJnkdMJs=;
        b=rt0p3plIF3Yd+hPP4LTmNU8AH0A90hnvMujeLk2as+yvaMj0EQptxjBA0DoE7kJ9hg
         rSASWm6h1sg3wSegETN4G9GYCn5P6B0LDybiMlJfu53HQ4bRBwiMzEm1fnf7nrQwEXM1
         Mr9Zt5MD+jCimycErmODkfOl+U9u5QLGQOBdHYi/XmfshwWmpjekmtUKewxjzR935d4P
         qR9RQjCM6iOd0K6t1kTXWmbxRyEniWZQ6EWR6QNlRfve+OWfWqre9+2pAEeuZ+e03znp
         pJKaEdbyN6ve6RkiGtVymhPiRMpFmHXpaKSjk1AkkguWMhQdsGty0Az4hHy4kw7UVCUi
         rBpA==
X-Forwarded-Encrypted: i=1; AJvYcCX18XZ7+05RuSZ5C6zdjiY/U7LRkMaS7AkkmrSQ9buInnVAAZ8+GjV7Y6wGg9JRPgzymlaNkkd9wD82M5l5nKpH@lists.infradead.org
X-Gm-Message-State: AOJu0YzgbiNVwkxtrDfbig9zRmO4weXzEVvWcm1nZEfsWRE1P5SjJtF1
	MU0lellpVJy9LY6S552gUwLjSdFEBTDqU4vVOh3IPst8jmoo3pPzhhpp
X-Gm-Gg: ASbGncuS3x+48wmEsGZ6mUDluFO7kmb6gSx2RQNMUpDIb7JUJzQYWw92xzWE1imrrGC
	IQGcMswuS6TCLxo9KZHr4aJZnU6gS+oRoKwwSwmv0FMMCX7rIz+/ZrI6S7nXvuj/M21v9F+DMia
	otOsSsQ/2Q4hfwk235yz1TAhSCblJSAO3c/N7doWNybrr9ekuzud+/WWksqgA/oAYeXDza9WRws
	BBEH1nKRfjvuKds2h9osLRXE5JYTH59cMWJRF65n61C7KyIdAEjQRpHBkr34gL3OajLfBicwh89
	fkiLYZg9DKiRKrABBr8e8SpAfvF3OgwSCZxaVHFBxitkEyREoWe6jBw5EI72o6UZiNvIt79jem6
	+ty9Ed1plFjHUUgy2ngYqeuU550I7Pm/OoqGuwvSTtyS6EAoBNEMsURLvyLdupPEVTvA6Lh6rl9
	EKpQZUwYMT
X-Google-Smtp-Source: AGHT+IHBvWsNWGPacN8UTX5YfRqDAFI5tNEvxSQah7xL7TEoK8EoMA73bDud3VP/tlRdpm4BfsNPjw==
X-Received: by 2002:a5d:5f53:0:b0:3e5:6297:dd21 with SMTP id ffacd0b85a97d-3e765782ab3mr7606735f8f.12.1757857522073;
        Sun, 14 Sep 2025 06:45:22 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea4b52b7fcsm1467591f8f.33.2025.09.14.06.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:45:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Input: s6sa552 - add a driver for the Samsung A552
Date: Sun, 14 Sep 2025 16:44:55 +0300
Message-ID: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_064524_333587_945BAEE2 
X-CRM114-Status: GOOD (  12.56  )
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

Hey folks,

This patchset adds support for the Samsung A552 touchscreen controller.
Naming is based on the current s6s* convention, used for Y761. The
IC is similar in functionality to 761, but has enough differences in
registers, bits and functionality to deserve its own driver.

Best regards,
Ivaylo

Ivaylo Ivanov (2):
  dt-bindings: input: document Samsung A552 touchscreen controller
  Input: s6sa552 - add a driver for the Samsung A552 touchscreen
    controller

 .../input/touchscreen/samsung,s6sa552.yaml    |  54 +++
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/s6sa552.c           | 439 ++++++++++++++++++
 4 files changed, 505 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
 create mode 100644 drivers/input/touchscreen/s6sa552.c

-- 
2.43.0


