Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1AFCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 18:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pZPnNNIfItaWXhurcxi0vMwTs0Lsqn4l/evDT63v+Tw=; b=kyqeZEdAw5NdVCV2pFi3AMQVOg
	xgQ+n4MgKWLbAECJMFqBeGrz+53cCMjpHVkKn5fpVmYAD3UAU8hVSDZDDNl32OuEeqB0J3YQqx8pr
	O9XpjGmYoL6kBDi4zKBXVvf/DZEYKhclKV1ZmsXYcbVi0sjE4OAFaDjX5Y06KQL50irnwUY6gvnhv
	Y5Kj58pt6fTyjWsHZj9qaa0kI6Cf2eBPJASvr0kgkZIe9CTGlXwIAptngbEorHPzg8eR0iD+nEv80
	RUgyIWE8AnNAHJVznuAhhbAB1FJ0ZstSuEffrG1kEWBW7l3zvAPfjPuvytbYDEcODLvCEoGZS3F14
	A8SED/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5TB-0000000Cd8N-0HlO;
	Sun, 26 Oct 2025 18:27:57 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5T3-0000000Cd5U-0WgF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 18:27:52 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1761503215; x=1762803215;
	bh=pZPnNNIfItaWXhurcxi0vMwTs0Lsqn4l/evDT63v+Tw=; h=From;
	b=m1Ow9j43CkZe4whqZREYpOs3d9RDjJCdpxl5z9mrSQVff0Do01TZnF+fqBHpDCJws
	 qH2MTfrk1F5yiBJdABNlryHZYp6GQoLOVvoMdMAjP72/l7JmugIdhtpiTI6mL45whm
	 Kk2rSBeN45f1OLms7vpUmHrgHjAI7KO4DI+YnalGOuc/2xgIsknY7mfM/zgtx3dDD5
	 td+gKlUG5VB2nagLl08ctJF7CnKQ1f/QUuhZEDV4TA59pFNDK6l/fu8J2etHq3BL6q
	 DKljwsIApQCGRztx1napPsTduJ9GaGMi/ovsRxfnKAh27mve3QIMPNj2LZ/xM4WtS5
	 mRskW/PdYhnCg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 59QIQqnR043047
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 26 Oct 2025 19:26:53 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Brian Norris <briannorris@chromium.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>, Jeff Chen <jeff.chen_1@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for samsung,coreprimevelte
Date: Sun, 26 Oct 2025 19:20:37 +0100
Message-ID: <20251026182602.26464-1-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_112749_819163_3FA2DDA9 
X-CRM114-Status: GOOD (  22.48  )
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

Hello,

this series adds support for WiFi to the samsung,coreprimevelte
smartphone (and can be straightforwardly reused for the other known
Marvell PXA1908-based smartphones).

The series is currently not intended for application as indicated in the
subject prefix as the firmware necessary for the operation of the chip is not
available in linux-firmware.

Instead, my intentions are to publish the recent developments regarding
the chip support (see the third patch of the series) and offer them for
others to use and if possible get some feedback on them and also
hopefully to spark some conversation with NXP regarding getting the FW
into linux-firmware which would allow this series to be mainlined.

Regarding the firmware I have been in contact with Jeff Chen of NXP some
time ago who promised to ask about it internally – I am thus now gently
reminding Jeff of the matter. I will also appreciate input from anyone
else who may help with upstreaming whichever version of the firmware.

The trouble of upstreaming the FW is mostly a legal one (although an up
to date version of it would also be very welcome) as it is available as
part of the stock Android of the devices with this chip and can thus be
used on individual basis, it cannot however be submitted to
linux-firmware by myself for instance as the license is not known
(although probably is the same as for the other blobs in the mrvl
directory) and as the submission would require a sign-off from someone
involved with NXP.

The third patch in this series fixes a serious issue with the WiFi
observed on the phone (see the relevant commit message). The form is
however not directly usptreamable and it is not clear to me how to best
make it be since it involves changing a data type which probably cannot
be easily be special-cased for the new chip and would likely break the
other chips the mwifiex driver supports if applied as is. I will thus
welcome suggestions on this, although I'm also hopeful that a possible
reasonably up to date FW would not require this workaround at all.

The series is based on the pxa1908-dt-for-6.19 tag of Duje's tree [1] as
it contains the necessary SDIO description in the phone's device tree.

I have not applied the trailers sent in response to v1 as it has been
some time and as this is not expected to be applied anyway.

[1] https://gitlab.com/pxa1908-mainline/linux/-/commits/pxa1908-dt-for-6.19

Cc: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>

v2:
- Rebase to Duje's tag.
- Add a new patch fixing observed firmware crashes.
- Link to v1: https://lore.kernel.org/r/20231029111807.19261-1-balejk@matfyz.cz/

Karel Balej (4):
  dt-bindings: mwifiex: document use with the SD8777 chipset
  net: mwifiex: add support for the SD8777 chipset
  DONOTMERGE: net: mwifiex: fix timeouts with the SD8777 chip
  arm64: dts: samsung,coreprimevelte: add wifi node

 .../bindings/net/wireless/marvell,sd8787.yaml |  1 +
 .../mmp/pxa1908-samsung-coreprimevelte.dts    | 15 +++++++++++++
 drivers/net/wireless/marvell/mwifiex/fw.h     |  4 +---
 drivers/net/wireless/marvell/mwifiex/sdio.c   | 21 +++++++++++++++++++
 drivers/net/wireless/marvell/mwifiex/sdio.h   |  1 +
 drivers/net/wireless/marvell/mwifiex/sta_tx.c | 10 ++-------
 include/linux/mmc/sdio_ids.h                  |  1 +
 7 files changed, 42 insertions(+), 11 deletions(-)

-- 
2.51.1


