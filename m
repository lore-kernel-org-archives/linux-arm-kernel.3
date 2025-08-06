Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE464C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TpB+PfzuWs/TM6R4B5yVrE9x1IKZVmu2ttqHx5YHmbA=; b=hRdwuOI13QhB/SfT6QMRBHmqe6
	mwps8mVF5kDD8ypI73YKUJpcoex9REeza6YADGvQRLcIHc/vFWwJxl7CBbQgCMGk4QSeLN4ShcogB
	SWTNQjo4zb1ja1wg9pI1pnWw5QlosOmaUpSf10QGwNqTqFHJ2JZkwBfbjgK8lOf/FQuZR+Vu077Jz
	Ur29XKUswhVEg6o6PaBdSMVv8J45bR5hx4XL17QFFYgIoMLpDGTCYGNiHpMGY2I+LCwOUKCjJRz83
	2Cu4yw2ZPUbDtyVW+j7c2NEwOCU2LRPQUTXGGwkCtolsJaAxDRagSikS9sZFingiHuA7pNL1pf7kF
	cEpd2qRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeOC-0000000FK6s-0jfi;
	Wed, 06 Aug 2025 13:41:08 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeLe-0000000FJdK-0aVc;
	Wed, 06 Aug 2025 13:38:31 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-af96fba3b37so586236466b.3;
        Wed, 06 Aug 2025 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754487508; x=1755092308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpB+PfzuWs/TM6R4B5yVrE9x1IKZVmu2ttqHx5YHmbA=;
        b=QIplF6/rL8vy/hXgCQdyOBAQHfUrUJvmcQsmKyfj+4qbr9MMfddbobs8T8/2waj/ne
         uEdfFpSzmj1Ee98h2s+x9k0Z8fFOUne4qa8CQ5Psy2WGoZ/0ovw0lgfs3pMhDTb3rYm5
         8Nb2LT3DsYpGqRFgAZ+8b4iZ0fe8N3tIml5O9cb+TocDVA/an3nJcWPiS4LFhi7K7c+l
         73Nkbg92ngWnYnnsgvv2c0SuIyL2wY/OQMjzNWFoA1ttPjzjgjcXUSFJz+KhqowIoCGF
         HTtR9y9WwGcn3Vt38s6vERVaQN0GKIgV58aAbJ+v+Fkc4T1s66fmnWjTCFs2MjhSDVSu
         hdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754487508; x=1755092308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpB+PfzuWs/TM6R4B5yVrE9x1IKZVmu2ttqHx5YHmbA=;
        b=hvp13gff4QYzZHcCTn+BggGiNK3tyOBpo19sf1d24LQQzZiajB2tgBUIiImufYsY78
         aw++Df9IIAmUoC9nevItm/eFn5uKgw98Hp+NMOuFM92189lCU3LvbofrXspbPmJGFP29
         H0ZKvSfkTUUANptV+oGtX/L1gy2TXOkSu/LX0x8o9XiEPW5/rZsHfPWfPA3Eh/TnqVRk
         0lEM529rlsNbLrKUxM5FF5CCx3KD90fvJeuB7oXlgdpuxWnEGyvTQbkEO+6kPN0pW14y
         +mjolUMQs/DJAvghf5KXFe7Zymp0WuLcmlSnQeo4hSJkZQ2rqwtTTDMG/FRoRLv9IRMh
         JkhA==
X-Forwarded-Encrypted: i=1; AJvYcCU5oI2OWBKGGbCbOtjQPrNrqEzGcjZ2ZbupwzVCnyOivF260ci9Cd9uD8ZaHN9i/kgoJYfjgRPHG0GsvwsmBwnz@lists.infradead.org, AJvYcCWD2ND/m3t/bwnhwLb4Tfnr4F1Pu9ZS37I67nZG5QOMQT8DfNxOgHW2GRg5GbGHvWoVkRNPLqC5/p5LGPgrjLk=@lists.infradead.org, AJvYcCXPbNwiU9/L1xrWlylURiZF7WNKcMjzA5YI9/PfoTDcjf5mwQDb9jFY2pkm6hzdw9SSRlTUkimq62bx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdx4Kddc40FgifIUrKWekq9DyfrZ3bv+qx0aBYBJf9o8zE5+wb
	i/9dqH2I/h5AdQI6snRGgtbVcVmeBsHhHaJIMBljPT+9qFdbe5qqaknB
X-Gm-Gg: ASbGncv5GBRokvTKTK+i4BYKdUeO27Gnezt9XZBjRWuWbdMYT5Vttf2vsl73YzcMv7e
	j/p/2iLFD0jYrSBIs6YlkV7CaDnQIvlwyWMlfz6jWHOwVgnIj8ks4Jip+zjj0NNDzAYaDFg0G0A
	fWhZOv2B7Lw80QSgpd9eEMAb/wXo9l3nDvRDzyh0hCsJnetKYdocJqagnRtuCqZ1WZMZ6VYXytV
	QAaxn9wMmRe+ud83qHbHdV5is6QidYB4n+BX17zZtsyNiYRyR7CUm5BL9zq7sIy6PFwRpMQSRxm
	pLegvEcHEjsE1/F4Wk8Nrljrcmb615UPlx4rCfGVKjm0b4NhKEc4TGzztPRJSSZSU7dV5e8YRKW
	MC6MD1JbGlT9WcjOQI1/S0M2mWxGNuUl4amuDd0SlxrGEEreF
X-Google-Smtp-Source: AGHT+IGei8vPsctsojGNv2hAMLvUFfLXGEm+CbuctTYxSQujN3sBsnPBDJoEEmvPeoL2QEoXA5JJdQ==
X-Received: by 2002:a17:907:7ba4:b0:ae0:c690:1bed with SMTP id a640c23a62f3a-af9903e69c1mr287290466b.51.1754487507913;
        Wed, 06 Aug 2025 06:38:27 -0700 (PDT)
Received: from A13PC04R.einet.ad.eivd.ch ([185.144.39.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c10asm1113170666b.116.2025.08.06.06.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 06:38:27 -0700 (PDT)
From: Rick Wertenbroek <rick.wertenbroek@gmail.com>
To: 
Cc: rick.wertenbroek@heig-vd.ch,
	dlemoal@kernel.org,
	alberto.dassatti@heig-vd.ch,
	Rick Wertenbroek <rick.wertenbroek@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] phy: rockchip-snps-pcie3: add support for rockchip,phy-ref-use-pad
Date: Wed,  6 Aug 2025 15:38:20 +0200
Message-Id: <20250806133824.525871-1-rick.wertenbroek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_063830_179872_F062771E 
X-CRM114-Status: GOOD (  11.61  )
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

Add the possibility for the RK3588 PCIe PHYs to use an internal clock instead of
a clock provided on a pin of the device. This allows boards that don't have a
PCIe clock connected to the reference pad to still function in separate clock
mode by using an internal reference clock for the PCIe PHYs.

This was tested with a CM3588 compute module on a custom PCB.

Without the new option, the default behaviour (PHYs using external pad for clock)
is applied, to keep compatibility with existing device trees.

Differences from V1 [1] :

- Documented the phy-ref-use-pad option in the DT bindings.
- Documented the extra optional differential clocks for the PHYs in the DT
  bindings.

[1] https://lore.kernel.org/all/20250715105820.4037272-1-rick.wertenbroek@gmail.com/

Rick Wertenbroek (3):
  dt-bindings: phy: rockchip,pcie3-phy: add optional differential phy
    clocks
  phy: rockchip-snps-pcie3: add support for rockchip,phy-ref-use-pad
  dt-bindings: phy: rockchip,pcie3-phy: add rockchip,phy-ref-use-pad

 .../bindings/phy/rockchip,pcie3-phy.yaml      | 21 ++++++++++--
 .../phy/rockchip/phy-rockchip-snps-pcie3.c    | 32 +++++++++++++++++++
 2 files changed, 50 insertions(+), 3 deletions(-)

-- 
2.25.1


