Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB1BC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vRQTyAD6/LtJP1mViFxGTV7MWeC7Erzm+rbDZD3bI7g=; b=GDqiNtqIe1rPFKj7MI2kIj5gGo
	29uU2CO1dcTxvfTtieesGh41MPDp1XuR8x3QEXxSkJzKZckA/Th5a2n+yNSaQvVocFBZ+s6eoTICD
	otvmLBCjWK2BO/DaBHl/3teCXuLhLvWab271+oApXkAKGYwFX/6+j1fLlXnRJ38MrMrMpdK2pxHnb
	ij9V7A00BSBkcv65HmgMYQYOprZQzxvbs4tAkwu2IqsLox2iiO6TR+gkjdxKHSeRAcFPvC8JUw1r5
	RIEMbNZ5zh01Ajcru5N/LLYwM66WT0Va8VjczUNcVSxikjugFEjn64kT6a+AsABhfpaeeL1fKyGVW
	MBQ29KIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uED56-00000007nFy-4Bk6;
	Sun, 11 May 2025 20:15:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uED34-00000007mmZ-0lRb;
	Sun, 11 May 2025 20:13:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so32569795e9.1;
        Sun, 11 May 2025 13:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994400; x=1747599200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRQTyAD6/LtJP1mViFxGTV7MWeC7Erzm+rbDZD3bI7g=;
        b=YuM9gwPzG1Cj/Ubp8ClfiHdNUlJMoeb5QuNzM7/F4hVMBv0S4OZI0/c+Z2UMm/apJe
         SUCQgkq9JzRCNkEZOoUaj0C/AO6fHcK1Vd0wVYqVpPJHOlO22GxbNugVYyYiTfEdfXFN
         AGnFpC3aaXJ/5sLcd+DfUVwySc6iet7D6QUsvqXcam+jMINSCrYD87cXdojBgl8LU7yi
         oGk3KDAf0mz9xSc35zwU/Io/yKNmgnl8hJRYBgUK0dR2+/GfxhqRdNhkL8v8CB+hLd1j
         vlCVVD7jsVQ58FBCFxlkGrJsVR+yC92Z/tfwR66rSj353oWL8ncIuHeJYlCATrM8yF64
         CsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994400; x=1747599200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRQTyAD6/LtJP1mViFxGTV7MWeC7Erzm+rbDZD3bI7g=;
        b=i57vfvxqqd7MUGRNyZigfPf9fhqbnDrJQqmYrqQq73dqZaf6yp3ZZJCpifEbnw9BSk
         JrQzn/zZwxnv8KVW1Cmq/3p3pSIfK7l9APSXDm2JlfpSufIsAmSfNkPm2XSgtVroWyBR
         YgmhZM/+N5QlkmbH1VA696gIi6fKuDGfiTrt17aw7GjWJVAMiAeaI4jjTrz3dlrAtxHS
         2e8bCT6ZVg5111Ew93Z21dMGuwWAdfqEQMhrVNV4+HgtJRTZmpQSf7115oLP75TpmiQ9
         TrtKsgAs0RgpWJXQWDzeos6mpcPNkGrsVF/n7gr6Mwuvw5t9mXjo52vD1mQZYLP4/8CJ
         eN7A==
X-Forwarded-Encrypted: i=1; AJvYcCVoMJskFJQdFG9pOZtryPe+/DLQYCgnu4OZwlqVuj/hcfwPsgA8RzQDK58xQ060Tz09bF8d5bwwEaw1pWcrNTA=@lists.infradead.org, AJvYcCWUJh0CZX5ofTIioZmSX/HYu1ZnWFpXohZ5Te9CvV2EJhMAhzUpeFOuG8bkGiJKxJZYxtrVvRzjJJtfhV80YWtP@lists.infradead.org
X-Gm-Message-State: AOJu0YwgRFq8NUekvtDHPX3Olhd4uujTYgZE0pK2z4jd05y7ZOIHXK0B
	UovJ8V6L19423qie+YCrEu+EKT9Yz07x1hM/cymm0ijLoH+Rlm8AxzQzNA==
X-Gm-Gg: ASbGncuI0gSMLL6xn9fj096OLJ+ehlGi81cSHGfcKWIbP2uDgMh43BVcwL38Y2EcB7M
	PWkSY2R7fjO9gAefLsIp8HwK9Ws6I28K0klBd5e6cJCjF1TfX8Gs2+DIFe7Q9DoZ7+3pGJ67BLM
	xFOuOcacRqhzmFRDlw+a1VrHia3VfJz1Qm0ShG/PV187EHPuj+V1PabiX5F1/+t0xjheB6Ug/LG
	6gJJvEI/dfRkBFl3yBsLG9u183HYHpoLlZ4Bc2uCF1m0Z4avnr8p8ekfMpgX+z1Wnbw4vJNTlUt
	7uL71PehzI96n/rTSirbVfp9PHylvXUSL99hDeGLa1A2Z6EA2ZrvfCucGJBGMNSR12bE6723VI5
	XvObwZRFWPekVEVkFHHz1g0kl2rakNpQ=
X-Google-Smtp-Source: AGHT+IGefwAiFZcWgg17TvQ1kAB3qdQoikkJRf7xlh5CqFYtfFSxmQQSC9lri+IHaKSlJy1iOEhTeQ==
X-Received: by 2002:a05:600c:1c9e:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-442d032fc29mr118863085e9.16.1746994399418;
        Sun, 11 May 2025 13:13:19 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:18 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next PATCH v4 00/11] net: pcs: Introduce support for fwnode PCS
Date: Sun, 11 May 2025 22:12:26 +0200
Message-ID: <20250511201250.3789083-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_131322_225584_DE81084B 
X-CRM114-Status: GOOD (  27.79  )
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

This series introduce a most awaited feature that is correctly
provide PCS with fwnode without having to use specific export symbol
and additional handling of PCS in phylink.

There is currently an equivalent series for this feature where
a wrapper implementation is proposed. I honestly don't really like
introducing layer of layer of wrapping to workaround stuff, so
this is my attempt at giving a more direct approach to this.

---
First the PCS fwnode:

The concept is to implement a producer-consumer API similar to other
subsystem like clock or PHY.

That seems to be the best solution to the problem as PCS driver needs
to be detached from phylink and implement a simple way to provide a
PCS while maintaining support for probe defer or driver removal.

To keep the implementation simple, the PCS driver devs needs some
collaboration to correctly implement this. This is O.K. as helper
to correctly implement this are provided hence it's really a matter
of following a pattern to correct follow removal of a PCS driver.

A PCS provider have to implement and call fwnode_pcs_add_provider() in
probe function and define an xlate function to define how the PCS
should be provided based on the requested interface and phandle spec
defined in fwnode (based on the #pcs-cells)

fwnode_pcs_get() is provided to provide a specific PCS declared in
fwnode at index.

A simple xlate function is provided for simple single PCS
implementation, fwnode_pcs_simple_get.

A PCS provider on driver removal should first call
fwnode_pcs_del_provider() to delete itself as a provider and then
release the PCS from phylink with phylink_release_pcs() under rtnl
lock.

---
Second PCS handling in phylink:

We have the PCS problem for the only reason that in initial
implementation, we permitted way too much flexibility to MAC driver
and things started to deviate. At times we couldn't think SoC
would start to put PCS outside the MAC hence it was OK to assume
they would live in the same driver. With the introduction of
10g in more consumer devices, we are observing a rapid growth
of this pattern with multiple PCS external to MAC.

To put a stop on this, the only solution is to give back to phylink
control on PCS handling and enforce more robust supported interface
definition from both MAC and PCS side.

It's suggested to read patch 0003 of this series for more info, here
a brief explaination of the idea:

This series introduce handling of PCS in phylink and try to deprecate
.mac_select_pcs.

Phylink now might contain a linked list of available PCS and
those will be used for PCS selection on phylink_major_config.

MAC driver needs to define pcs_interfaces mask in phylink_config
for every interface that needs a dedicated PCS.

These PCS needs to be provided to phylink at phylink_create time
by setting the available_pcs and num_available_pcs in phylink_config.
A helper to parse PCS from fwnode is provided
fwnode_phylink_pcs_parse() that will fill a preallocated array of
PCS. (the same function can be used to get the number of PCS
defined in DT, more info in patch 0005)

phylink_create() will fill the internal PCS list with the passed
array of PCS. phylink_major_config and other user of .mac_select_pcs
are adapted to make use of this new PCS list.

The supported interface value is also moved internally to phylink
struct. This is to handle late removal and addition of PCS.
(the bonus effect to this is giving phylink a clear idea of what
is actually supported by the MAC and his constraint with PCS)

The supported interface mask in phylink is done by OR the
supported_interfaces in phylink_config with every PCS in PCS list.

PCS removal is supported by forcing a mac_config, refresh the
supported interfaces and run a phy_resolve().

PCS late addition is supported by introducing a global notifier
for PCS provider. If a phylink have the pcs_interfaces mask not
zero, it's registered to this notifier.

PCS provider will emit a global PCS add event to signal any
interface that a new PCS might be avialable.

The function will then check if the PCS is related to the MAC
fwnode and add it accordingly.

A user for this new implementation is provided as an Airoha PCS
driver. This was also tested downstream with the IPQ95xx QCOM SoC
and with the help of Daniel also on the various Mediatek MT7988
SoC with both SFP cage implementation and DSA attached.

Lots of tests were done with driver unbind/bind and with interface
up/down also by adding print to make sure major_config_fail gets
correctly triggered and reset once the PCS comes back.

The dedicated commits have longer description on the implementation
so it's suggested to also check there for additional info.

---

Changes v4:
- Move patch 0002 phy_interface_copy to 0002 (fix bisectability
  problem)
- Address review from Lorenzo for Airoha ethernet driver
- Fix kdoc error with missing Return (actually missing : before Return)
- Fix UNMET dependency reported error for CONFIG_FWNODE_PCS
- Revert to pcs.c instead of core.c (due to name conflict with other kmod)
- Fix clang compilation error for Airoha PCS driver
- Add missing inline function to pcs.h function
Changes v3:
- Out of RFC
- Fix various spelling mistake
- Drop circular dependency patch
- Complete Airoha Ethernet phylink integration
- Introduce .pcs_link_down PCS OP
Changes v2:
- Switch to fwnode
- Implement PCS provider notifier
- Better split changes
- Move supported_interfaces to phylink
- Add circular dependency patch
- Rework handling with indirect addition/removal and
  trigger of phylink_resolve()

Christian Marangi (11):
  net: phy: introduce phy_interface_copy helper
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phylink: introduce internal phylink PCS handling
  net: phylink: add phylink_release_pcs() to externally release a PCS
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: support late PCS provider attach
  dt-bindings: net: ethernet-controller: permit to define multiple PCS
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha SoC
  net: airoha: add phylink support for GDM2/3/4

 .../bindings/net/ethernet-controller.yaml     |    2 -
 .../bindings/net/pcs/airoha,pcs.yaml          |  112 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  155 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    3 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |   13 +
 drivers/net/pcs/Makefile                      |    2 +
 drivers/net/pcs/pcs-airoha.c                  | 2921 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  241 ++
 drivers/net/phy/phylink.c                     |  287 +-
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  104 +
 include/linux/phy.h                           |    5 +
 include/linux/phylink.h                       |   14 +
 14 files changed, 3883 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 drivers/net/pcs/pcs-airoha.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.48.1


