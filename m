Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BB5E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 02:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IaKghO/r+2Gyti02wCKlEV8is/DOem4Byb1BzTfl/uk=; b=R4wVqVdw34J9gWetPy8nJVznpL
	GZFA6xEP3XsBof4HYwkYAvJZJ6WXfExXqiUzY/VGsONwGFgOZWHFfGn1tMyo9LW50eMgVazPhcpb/
	vfYORESEpP33LMIB97K4A6nPQYl7/rRM12zhxEnmX74DAy+bo+t93NO2x/Hf5B35s01qe6eFtCJxl
	5a+K9H2CEFdlb03bh1B+gi3ummiQA6SDkDJYQ5920Z3QCVuYRFkyb3ynzgbIraiQDkpphp+8F+tsI
	HB1MreVvBFmi1fftTxS5J4am5Gku3/05Z0OVYN7i6iGxAlxT86etlNwm9aCRMAQvHXPF4WDX+9PyH
	j9uU2bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIerY-0000000BGGJ-1QzI;
	Wed, 04 Dec 2024 02:11:36 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIeqX-0000000BG5V-1L4j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 02:10:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-215ac560292so23172865ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 18:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733278232; x=1733883032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IaKghO/r+2Gyti02wCKlEV8is/DOem4Byb1BzTfl/uk=;
        b=brgx49cpzsBocHTj7oRHBhpTV8KhQKzh74W/1tpICX+/35Qij6M3EZ/walS/6yIObL
         r0DHZGN3MojULAFQxTMCp9EDf3tTPF8ZwTxajJJAjmZmR1b8rYiVgB9WHpq7NyyBU3VI
         xsRNTxWICSV7wx+Z0GtT7nnVfHdBy8idwAZYnngsA1xZZkIuSOiUQh2VHv/BjIKgGrBA
         67phGeIqthJpiVgl2pCEW9OEKSPrgj5P7QNWEhsOjoY4DRGfZDPp9PF31DLy8smfNQ6F
         J7ebiTMmMzopAZ2xRh/Y3NxFEyXAryVx7HQyxDpsngnXqBBrmMxgW7mh8r/WgLprZ83o
         mANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733278232; x=1733883032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IaKghO/r+2Gyti02wCKlEV8is/DOem4Byb1BzTfl/uk=;
        b=UA5Syx6zTehHqZzYT3mPEm4GKsakElJ4qlhSlSzIvR7AqLIHGVJ7WkXmRUqRv1SR4j
         WtExSXlNxx5mQXC5YU9px/iTWXUOS1Ejs0h2QyPyeKTt45bpqWoxNyu/bbDuQ0FcXFtW
         VzvhPt0KU0Rx+kbLfx+wIiromm0qRJXtD+UTrHeD8jtBWSfAu5KXPY/Onwb5TLgNeyeK
         rw+jtsl9m2HZN+h0ZsCwlc7wYUna28ouKD/9GAQbl/blY4pnvtbWc2fGbC86wtBG1l67
         swhIX3F6aQeSOhxjY0z6kyTKfoY5asqSAL4YWhizQbx5ml3bvBymx2l7HuQe5r+ysPnp
         nXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAEmjTP0D6N0t0Eflk87aBCxIZsy82QGW8V3aby3URcFexrJG/F9i9E0Tm07iIE2EDVOpFb/UzNodCdApWkc05@lists.infradead.org
X-Gm-Message-State: AOJu0YxcWlrswa+xfMjBP1XcFW/ZZCq/JQgGdVY7tME0vocycvw4WhaQ
	zmvf0YSVta7q3qzPDudUcz+B8BwyDHxgxvOb4qbMfEJcVO8Ulp/rQb84nw==
X-Gm-Gg: ASbGncs/ExJbd+gjrN+eZBZdJ11Bl7nb6XliYSZAFlWtW6WVTh4z4lGnZcLMUngEPbC
	dt7dt/aKWkVdLAOUoLCxyF2A/3HPg7j9xnGQ9gfCmEck3PPTaBDkpLM412L8NVz+W/9lVJceWs5
	nYKK/4NvDVzeRRVP1+JwO1KIqneUOP5p3qzyd7vfVLbeEM5Arl9fiHSpfcysf1mZOMT0em+jqeO
	c18aqFNz6dydN4N6vjAOyVt9YLjkgJjTRO17q2DAeTlfq64TpdOUAaaMX6NUVF5GVSCFudpl3An
	bajWqWSbd1oCUzzdgkrjUivBDHaIO0YB/cY=
X-Google-Smtp-Source: AGHT+IEc9TYX6FFd5h8hWzBuIlSjssU8B0ZQDuXFK/cXrs5QVelUZhulFTMRvrIPuDQyFFV2pQNAWQ==
X-Received: by 2002:a17:903:189:b0:211:6b21:5a88 with SMTP id d9443c01a7336-215bcfbe4f4mr55902545ad.20.1733278230412;
        Tue, 03 Dec 2024 18:10:30 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2156815bcfesm62785115ad.215.2024.12.03.18.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 18:10:29 -0800 (PST)
From: Ming-Jen Chen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v4 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Wed,  4 Dec 2024 02:10:12 +0000
Message-Id: <20241204021014.5083-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_181033_358058_87C1887C 
X-CRM114-Status: GOOD (  16.72  )
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

This patch series adds keypad driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 keypad driver.

v4:
  - Update nuvoton,ma35d1-keypad.yaml
    - Kept the same order of properties as in the required block.
    - Changed register addresses to lowercase.
v3:
  - Update nuvoton,ma35d1-keypad.yaml
    - Removed vendor-specific properties and replaced them with common properties
  - Update ma35d1_keypad.c
    - Modified the driver to reflect changes in the YAML properties
v2:
  - Update nuvoton,ma35d1-keypad.yaml
    - Fixed warnings and errors generated by running checkpatch.pl
    - Removed the previous version's properties and rewrote the
      properties in the Device Tree schema.
    - Renamed the Device Tree binding file to nuvoton,ma35d1-keypad.yaml
  - Update Kconfig
    - Added COMPILE_TEST to the depends on line in the Kconfig
  - Update ma35d1_keypad.c
    - Refactored error handling within the probe function.
    - Fixed the mixed use of devm and non-devm resource management.
    - Corrected alignment issues in the code.
    - Updated suspend and resume handling methods.
    - Fixed variable naming to remove camel casing.
    - Used for_each_set_bit() to check key states.
    - Modified the code to align with updates in the device tree binding

Ming-Jen Chen (2):
  input: keypad: add new keypad driver for MA35D1
  dt-bindings: input: Add Nuvoton MA35D1 keypad

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  69 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 386 ++++++++++++++++++
 4 files changed, 466 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


