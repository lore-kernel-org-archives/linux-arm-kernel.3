Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30370F8A167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 12:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLcgYHB46Ktz0E94r19iOcll6svKQTg1l7RztdPevJY=; b=iT6Xup/Z3COIMxATBNdf0ojq1H
	eLi/H+32WZDFXlUai3eq3gNEQG5IMYLrnlWyAz5YvcE8a7Kzz6jCFlKmtb7WQSdjn2HxZaUXOVWcV
	zc7NopCTFzYttuDFMpYJQpz/mZiZ9oeDcquHBt81MAGYmlV+fyGh2g59sDwil8dHLmT4uaiDkKYLJ
	MF3QNSiGK88+kegeVjDUl9TpYaDzdIJhAHdIhg14pcDJdeeVRbVqYnr27FAI+RfQ1RBX6ksXk/1Zv
	AuS1f8LZOsz0e54c3GXIRF1ANFZ6y5rKQpybzOekwpdJBRL3YF/b+3fZiZRpGPrIrppWLeF3C5M8l
	qYoTqOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLR4-00000002PvK-2iOo;
	Thu, 16 Apr 2026 12:03:06 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLR2-00000002Puz-0ZuR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 12:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KLcgYHB46Ktz0E94r19iOcll6svKQTg1l7RztdPevJY=; b=X8q8vfHsh6bHKZaIkqGeHZMvnn
	iPSQ7uUqdZxgQt4uq/c3n5wkOmAB66rdOebMjAY8xDTQ5HC+7le9rfudkTlg04xZPH9+QldfqV3W1
	DT6H38LTf9IyCdpp+iBZlOBvTD+xx0ENtwOyCBfUWW/qDW4QpsLLk2kVpTATLUbvdNEwevq/TsNoi
	fhYlRkT3BKUFfYXleI1ErlCMnWe5MRTapgfvvrHhGtbsEXgQCEZTkI3FutyXUoXPoJzYrMOi+69wm
	kO4YrY4k8Lf+NQ1W1JVnOVnaa/8W6kAwaU7Ci6z7OCFev6/gMfFaIJ/8jmOHqeTQI/3xzVZqwQJeP
	vSb7e7CA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wDLQs-000MvA-2a;
	Thu, 16 Apr 2026 14:02:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wDLQL-000EJr-0I;
	Thu, 16 Apr 2026 14:02:54 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
Date: Thu, 16 Apr 2026 14:02:53 +0200
Message-ID: <2410317.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk> <5987484.DvuYhMxLoT@steina-w>
 <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27973/Thu Apr 16 08:24:10 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_050304_289120_7F17DA18 
X-CRM114-Status: GOOD (  36.27  )
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

Hi Russel,

Am Donnerstag, 16. April 2026, 12:49:25 CEST schrieb Russell King (Oracle):
> On Thu, Apr 16, 2026 at 08:20:13AM +0200, Alexander Stein wrote:
> > Am Mittwoch, 15. April 2026, 14:59:32 CEST schrieb Russell King (Oracle=
):
> > > On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
> > > > Hi,
> > > >=20
> > > > Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King=
 (Oracle):
> > > > > Move the PHY attachment/detachment from the network driver out of
> > > > > __stmmac_open() and __stmmac_release() into stmmac_open() and
> > > > > stmmac_release() where these actions will only happen when the
> > > > > interface is administratively brought up or down. It does not make
> > > > > sense to detach and re-attach the PHY during a change of MTU.
> > > >=20
> > > > Sorry for coming up now. But I recently noticed this commit breaks =
changing
> > > > the MTU on i.MX8MP. Once I simply change the MTU I run into some DM=
A error:
> > > > $ ip link set dev end1 mtu 1400
> > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
> > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
> > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
> > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
> > > > imx-dwmac 30bf0000.ethernet end1: Link is Down
> > > > imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
> > > > imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initi=
alization failed
> > >=20
> > > This basically means that a clock is missing. Please provide more
> > > information:
> > >=20
> > > - what kernel version are you using?
> >=20
> > Currently I am using v6.18.22.
> > $ ethtool -i end1
> > driver: st_gmac
> > version: 6.18.22
> > firmware-version:=20
> > expansion-rom-version:=20
> > bus-info: 30bf0000.ethernet
> > supports-statistics: yes
> > supports-test: no
> > supports-eeprom-access: no
> > supports-register-dump: yes
> > supports-priv-flags: no
> >=20
> > > - has EEE been negotiated?
> >=20
> > No. It is marked as not supported
> >=20
> > $ ethtool --show-eee end1
> > EEE settings for end1:
> >         EEE status: not supported
> >=20
> > > - does the problem persist when EEE is disabled?
> >=20
> > As EEE is not supported the problem occurs even with EEE disabled.
> >=20
> > > - which PHY is attached to stmmac?
> >=20
> > It is a TI DP83867.
> >=20
> > imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:03] driver [TI DP83867]=
 (irq=3D136)
> >=20
> > > - which PHY interface mode is being used to connect the PHY to stmmac?
> >=20
> > For this interface
> > > phy-mode =3D "rgmii-id";
> > is set.
> >=20
> > In case it is helpful. My platform is arch/arm64/boot/dts/freescale/imx=
8mp-tqma8mpql-mba8mpxl.dts
> > Thanks for assisting. If there a further questions, don't hesitate to a=
sk.
>=20
> Thanks.
>=20
> So, as best I can determine at the moment, we end up with the following
> sequence:
>=20
> stmmac_change_mtu()
>  __stmmac_release()
>   phylink_stop()
>    phy_stop()
>     phy->state =3D PHY_HALTED
>     _phy_state_machine() returns PHY_STATE_WORK_SUSPEND
>     _phy_state_machine_post_work()
>      phy_suspend()
>       genphy_suspend()
>        phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN)
>=20
> With the DP83867, this causes most of the PHY to be powered down, thus
> stopping the clocks, and this causes the stmmac reset to time out.
>=20
> Prior to this commit, we would have called phylink_disconnect_phy()
> immediately after phylink_stop(), but I can see nothing that would
> be affected by this change there (since that also calls
> phy_suspend(), but as the PHY is already suspended, this becomes a
> no-op.)
>=20
> However, __stmmac_open() would have called stmmac_init_phy(), which
> would reattach the PHY. This would have called phy_init_hw(),=20
> resetting the PHY, and phy_resume() which would ensure that the
> PDOWN bit is clear - thus clocks would be running.
>=20
> As a hack, please can you try calling phylink_prepare_resume()
> between the __stmmac_release() and __stmmac_open() in
> stmmac_change_mtu(). This should resume the PHY, thus restoring the
> clocks necessary for stmmac to reset.

I tried the following patch. This works as you suspected.

Thanks and best regards
Alexander

=2D--8<---
=2D-- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5875,6 +5875,8 @@ static int stmmac_change_mtu(struct net_device *dev, =
int new_mtu)
=20
                __stmmac_release(dev);
=20
+               phylink_prepare_resume(priv->phylink);
+
                ret =3D __stmmac_open(dev, dma_conf);
                if (ret) {
                        free_dma_desc_resources(priv, dma_conf);
=2D--8<---

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



