Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328EBC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTTrNTGhub8A8V0WSX4PYi6yLCXMR+wXKB4MowDi9Gg=; b=cjsUtJCTKZNXwVxRu2mfwujXf3
	SEwWgJ+EhHSzF4lqbrwuoJoCYcror+YTsFwtcOsnhrkBg8uscDett4VhDN8xOxsnhOBob8UGDfibC
	7JAF79JP+rGpiw42H8noFGAObFDg/ziP3ib/+RV2VnQOfYKi2VuPxGFNSs3xBFuz81UqH1TTlC/cz
	CT4bDp4HRADZ8uVEXj9hhE4MhSnGvvC/JWxkl7u/OCzPm6LBEXQFnku2CqAwnoEvK0ruiA4YY8cv7
	Kr8H4DQvy+exCke+Uo6EGCEU6wuIEWWIjrmfNEBImmR1+cwMGaRpeJy/keSEkHmpIgnnUaULahxxV
	t+kGXTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZF6K-00000006XZu-2vPq;
	Tue, 08 Jul 2025 20:39:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZElA-00000006U45-1VJI;
	Tue, 08 Jul 2025 20:17:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso4199724b3a.0;
        Tue, 08 Jul 2025 13:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005867; x=1752610667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTTrNTGhub8A8V0WSX4PYi6yLCXMR+wXKB4MowDi9Gg=;
        b=CbIRtXLZa9dnSjd/aes+mVCD4C6DTlmc5TUKpZgEzQhFrFgLXe+vDKc/EuMJfHqDOn
         1/wUVUvLvMI73iTe0dLog8MNcc7wcTDXZCPWEzakpQH1x0/8W4XEzUFotC6yta3q4WKt
         fxslELPfsZy16S0KaEnx+D3DF6yBHbVMpEwqKK1k9AOoT82sA8ubmdPh3h2v+Os+yDht
         jDg6KzjnzEiTJFSONG1iiAQwSds/bvbVHXBIlIO4E3RTB6HuC27lLPSyBm/766U9rmNK
         67RuREaGaJVzWDluRXIk0n2jsOPYXcItqXEcwuRF5FptTvhWBQeeiHISR1oNgGOdHb/m
         CL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005867; x=1752610667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTTrNTGhub8A8V0WSX4PYi6yLCXMR+wXKB4MowDi9Gg=;
        b=wZZ9uLFCusn35HE+YD/JigiJyIIJwFJ9Hl/unoVAhUVP7Hw5mxxOWtAVfak5IjP/j3
         vQmEFGfkFisLEXT7/MVgT9fKdmfdBbMW5xCOYxnke8Mw5IeoxT/3nirXwOcYsb1kGDFo
         UMKehPp/AdORhuM+kOF8r62xKs6CxRoCs82azxxnkeJo05lLBP1fWsDJOhc6UJKQ6MG0
         M2IK8DHrF1uIOobaDXO5WQDPxOJQzjabHBKm6yNSUhFYqS80LDHnkl1BoSOavCYzh06N
         Z5zZDs4Y8njOKdMpGlRpHNo25chDt1PPJHGpGTYqLjDcQLCSXk/aDPzu10+38O7T+mR6
         sKMg==
X-Forwarded-Encrypted: i=1; AJvYcCUxp45jjInr1NbiBug7BxJGi0vZ1/6ZciGt8GE3Z1KB6aQCFPPVP7E21jC6jmj7fXol5WVuyP15+p0KktTSykYw@lists.infradead.org, AJvYcCVonDQpcq70oRqrqoE2NUcFCqg/T3kEcplZqO0LRk0Vu8si4t3IQS+ylrFE2PofdN5Nvj5fl/4KEHdARC/BX8M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWc33h6wF0GEwIO5VA8HnC3KacX8n/pSdB2cS/4S4gkZgXJdsX
	abXecXvGV7M8BBS/IPiVMlGevEfPoNj49lkWVOZUn8tkZWszZGgdrxkk
X-Gm-Gg: ASbGncu6pcXb2MlIbgUT5YaHm9SuqvL8X+6OoNp+n5So1x8R0JpNMpD63TM17qsAZiW
	WcYnrB9soknCI3EJYtiqHEmq4IsWVVPqVqYT/wi0CXiigv7xZaalHbkzS71i/Zl8pC00Kexoe7L
	9zOvuXGcrQuzoFG0Hirvb/p68dN8fMQQRc7j2KgJuYSwTEoQn54FfKDPCgJ2gULV+Vje+cjuexh
	3tM4aZgpRDv+eK6ae5nWpwXHbKh5VMHXKihkvUKBlYX9NgDf33eenewqWA+iPbcJlvTIOaxNFwm
	R8zyrs2bDVr7tWqLVfRmypQF+ltAdkTgoOx9JpGG+T8=
X-Google-Smtp-Source: AGHT+IGIcRTQ/IVzI2tJOroz5Lqm+kvT8pKeiBj/N2Gf7unUpL73LQu99cUIoFH4FDd+4jyRsbL5bw==
X-Received: by 2002:a05:6a20:a10a:b0:220:2da8:325c with SMTP id adf61e73a8af0-22606387110mr30289384637.0.1752005867470;
        Tue, 08 Jul 2025 13:17:47 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f5d8csm12289625a12.39.2025.07.08.13.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 13:17:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 wireless-next 0/7] wifi: rt2x00: add OF bindings + cleanup
Date: Tue,  8 Jul 2025 13:17:38 -0700
Message-ID: <20250708201745.5900-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_131748_396358_E88494A4 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

It doesn't even compile. Added OF bindings, documentation, and other
stuff to hopefully this doesn't happen again.

v2: move all of 2x00soc to 2800soc. I didn't realize only two functions
remained for no good reason.
Fixed typos.
Slightly changed probe for clarity.

Rosen Penev (7):
  wifi: rt2x00: add COMPILE_TEST
  wifi: rt2x00: remove mod_name from platform_driver
  wifi: rt2800soc: allow loading from OF
  wifi: rt2800: move 2x00soc to 2800soc
  wifi: rt2x00: soc: modernize probe
  MIPS: dts: ralink: mt7620a: add wifi
  dt-bindings: net: wireless: rt2800: add

 .../bindings/net/wireless/ralink,rt2800.yaml  |  47 ++++++
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 ++
 drivers/net/wireless/ralink/rt2x00/Kconfig    |   7 +-
 drivers/net/wireless/ralink/rt2x00/Makefile   |   1 -
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 102 +++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 151 ------------------
 .../net/wireless/ralink/rt2x00/rt2x00soc.h    |  29 ----
 7 files changed, 156 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.h

-- 
2.50.0


