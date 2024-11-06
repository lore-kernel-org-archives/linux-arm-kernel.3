Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08F8D44D58
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nd7Yyls8bxkG0sJ+SExvF+TjygQKqRXiCTn67uB60tY=; b=AHhD9NwQOwIj5N8dTza/X7fAXt
	Y4qLuWh7mU/yC9q0DGDHMZJsU9xS4AWomwpzJfG2yiqHEpJ0BeRqaoBVc9xcWKLIq3ks4T8S0TpsU
	28Obcv8FLK/XDgQ5FXIpGN7M2o1IuQZinkBQAuwgvwiPMzYTjPDow60C3q8sBpVOnQn2W/Z68z+9J
	+hUpB6AE34QlY9FWR1GG3b0Ndg8Z2mq+TkPjyLUD0XR1uvKxU6k9BA6MOa9f0+vybCxllWurENNDW
	muuzkPCbtDwGAQG7jOm1Xc2g/5YJmIBaEwSfQxwGOBldMap4JV5KXV2qyLjPR6l/vWyf3e0m0d329
	gGoHRL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fuA-00000003NPV-0MbR;
	Wed, 06 Nov 2024 13:17:02 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eyY-000000039Fu-3HpL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:17:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6CH8Ju067692;
	Wed, 6 Nov 2024 06:17:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730895428;
	bh=Nd7Yyls8bxkG0sJ+SExvF+TjygQKqRXiCTn67uB60tY=;
	h=Date:From:To:CC:Subject;
	b=y1FjKAkQy+DIMAOY3LAIOFtY+pK8j13tRSL3QiLK0iDhwAa64FEkdG8O4m0cOFXtt
	 1oM+AX6hbxLjzxg0s7vvsOFba/ioeifLpN2ndhMvOpTygMNSpM1KD2q3LEBUsNncy/
	 3KDsQa3Ee43nX60nSKytjiuJH1cF1I8lie13uEyk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6CH8Hb017034;
	Wed, 6 Nov 2024 06:17:08 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 06:17:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 06:17:07 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6CH8Qn083811;
	Wed, 6 Nov 2024 06:17:08 -0600
Date: Wed, 6 Nov 2024 06:17:08 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>
CC: <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony
 Lindgren <tony@atomide.com>
Subject: [GIT PULL] soc: ti: Driver updates for v6.13
Message-ID: <20241106121708.rso5wvc7wbhfi6xk@maverick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ih4nfsy4jsvbujjr"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_041731_041359_FEFAA375 
X-CRM114-Status: GOOD (  10.34  )
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

--ih4nfsy4jsvbujjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v6.13

for you to fetch changes up to a4c14f509509a6a24f25edb7619f55f204a8433f:

  firmware: ti_sci: Remove use of of_match_ptr() helper (2024-10-25 12:56:3=
7 -0500)

----------------------------------------------------------------
TI SoC driver updates for v6.13

- knav_qmss_queue: Cleanups around request_irq params and redundant code.
- ti_sci: Power management ops in preperation for suspend/resume capability.
  Also includes dependency patch to export dev_pm_qos_read_value
  (acked by Rafael).

----------------------------------------------------------------
Alessandro Zanni (1):
      soc: ti: knav_qmss_queue: Drop redundant continue statement

Andrew Davis (1):
      firmware: ti_sci: Remove use of of_match_ptr() helper

Dave Gerlach (1):
      firmware: ti_sci: Introduce Power Management Ops

Georgi Vlaev (1):
      firmware: ti_sci: Add support for querying the firmware caps

Jinjie Ruan (1):
      soc: ti: knav_qmss_queue: Use IRQF_NO_AUTOEN flag in request_irq()

Kevin Hilman (1):
      firmware: ti_sci: add CPU latency constraint management

Markus Schneider-Pargmann (1):
      PM: QoS: Export dev_pm_qos_read_value

Vibhore Vardhan (1):
      firmware: ti_sci: Add system suspend and resume call

 drivers/base/power/qos.c               |   1 +
 drivers/firmware/ti_sci.c              | 489 +++++++++++++++++++++++++++++=
+++-
 drivers/firmware/ti_sci.h              | 143 +++++++++-
 drivers/soc/ti/knav_qmss_queue.c       |   6 +-
 include/linux/soc/ti/ti_sci_protocol.h |  30 ++
 5 files changed, 662 insertions(+), 7 deletions(-)
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--ih4nfsy4jsvbujjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmcrXj0ACgkQ3bWEnRc2
JJ36TxAAh4kYatZvq4I71XeciAfFK6VujsT+qEMjXfxf077vPRRiJkvjV3Kr0Yok
RvuYgSysH7zx5vFYEnvImlgE7cesq5DQeXeMalFSv4QSU+wKgDI5K7EJefAfXX1x
0BFQG1cIcdMJ1D1etL/evVrB2KG7V/zsouVVRvlx2rAmqVYREYFasO1GbbB4P4Df
UTHFORVlqRby3HuoLujCBULsE8giPx0XJEu2qgOVbgKjzaeXcVOkqS17W//EszTZ
8bRiGDhF73oWoDyzo5ERgNI4QyaWAQJSfROt3Atm4DBYiAkWvrPT4JoLhrZRvJ1v
1OYLxs5sCFY/uv2Fryq1fCPmYSV5JXorgOfJRdPa2LDURZvBaFn744brbz1yFtAT
QaxalE5ISlN+PeanHtqJ1Cov02BxdT1hv2nhmCPUWaOM2iQ+3wD9rQiww1qhQmgR
XthNmZ2l7toBzdw3zKvX5CN9FbMZ5oXRLvWG8/NzXcFGjJbxBm9wqRVaCLSqA8Cl
vq8KTTb1XTTVveBc1rOBfQ5EiF6GKRlqMcpzY5NcSpfJRgzCST43EgZsWm8y8aO5
XQK8n04nF7QLP4MLvVr8O41xDXaB+oO95y2PgbVNgz/Ktijakxc4/2Dn8gJrqnsV
G9SXyl7SaLch0YYlArACBiZeIIkCVr2EGsUMRkRrGHRTl5tE7kI=
=3YLN
-----END PGP SIGNATURE-----

--ih4nfsy4jsvbujjr--

