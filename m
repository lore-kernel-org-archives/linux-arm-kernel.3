Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B368E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iYj+rrub;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=OF35KZXi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dr7HLHhmpNPRnakRx/XUhqvaTum3bMcddo5f/qe4qo8=; b=iYj+rrubYjY4WIfYWrNNQ4TIl1
	FeQjHKp7JfCt9fk8OOuOKK7oUptMJAc3G43ZDIsaKczRwiIjvBWvQb6tFlwHUXz8V+fFyWVp25WAb
	m9UoiR3E/YibQjeIqLMfxSDFABJbahTunJQuJlox1Ty1TAQv748Lcrtho6/Zi9yfVzNx84OqFaCJL
	zHeHnKzvYobKuXNtNG08mn36IBiwzgM2KuLX60vSE1Qmz+5pyMEwiDoLRezX+bdPBeXz8pRdopypN
	uCMFLB04p/oQdi9VPQ20ol+PV1bnpUKqBwAEPd/DDI7QFqdO1h0raP8KhYK5LXYariuaRlpgl6A4K
	OVCCKYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNfFo-0000000FG5q-26un;
	Sun, 01 Nov 2026 23:46:24 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNfFm-0000000FG5B-1H7y;
	Sun, 01 Nov 2026 23:46:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793576767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nFF1HpSoEVKhGCa2OjQyYkqXJZOKSIszAnZw1s8222Xrd2kMjrb/JcjP3+xgAd+EF7NfYB4nI2t+0PS1ovEAqX4peypVDFBqTzX/0AWf47TWUVceAD+RGpLxXtlY9xOlLrkcoFg6rr9+F5deTI01HGYkyA3aAge++eGOasLzxdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793576767; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dr7HLHhmpNPRnakRx/XUhqvaTum3bMcddo5f/qe4qo8=; 
	b=fDZ8nHTaKuu9Udy2AaJvmQ8QdcNnymHS9p3SPvy7VJHRGxuwc3tLHvh9xsL4zQ3lbHV+R/D79My3/rJtwro5JPPqGjldw0Z8l31fEk6rRBq1qtMaUAdBA7hxFD94jVJjm5yrfwjBgNI+d8fz6vTxJ8KxXjbSac9lI3XvD6Qz2T4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=OF35KZXix3qxySfPAxVSiT1w0GHR1ywyUWFKqT6KVakay3bNiAr3UYgre4i65utKFaTYjgZN7BbziQ2+msK0hMPQoM354DuzAXpPzGiYkYW3t0iUN+xy1BJA/KoQ4yBEq01U8ZqH3K2H4bPQfO8HcTIibsUmZqCQq1YkbVTYEM0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Dr7HLHhmpNPRnakRx/XUhqvaTum3bMcddo5f/qe4qo8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793576765533498.29275941676076;
	Sun, 1 Nov 2026 15:46:05 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 53936180371; Mon, 02 Nov 2026 00:46:01 +0100 (CET)
Date: Mon, 2 Nov 2026 00:46:01 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Message-ID: <aufM3PCuU9CM8zFo@venus>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <179353091270.2955.16595397888583885694.b4-reply@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z4xoeqz7d7xqkqyp"
Content-Disposition: inline
In-Reply-To: <179353091270.2955.16595397888583885694.b4-reply@b4>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.557.36
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_154622_370022_A516B845 
X-CRM114-Status: GOOD (  20.37  )
X-Spam-Score: -3.1 (---)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--z4xoeqz7d7xqkqyp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
MIME-Version: 1.0

Hi,

On Sun, Nov 01, 2026 at 04:31:52PM +0530, Manivannan Sadhasivam wrote:
> On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> > The recent Rockchip platform have a combined PHY, which does USB3 and
> > DisplayPort as well as muxing the lines in arbitrary order. Changing its
> > enabled functionality requires a PHY reset and as the PHY provides a
> > clock to the DWC3 controller, this can result in an SError. Apart from
> > that the PHY might not start up correctly when the DWC3 PIPE interface
> > is running. This series prepares a Rockchip specific DWC3 glue driver to
> > help out with these problems. To become useful more patches are needed
> > on the Rockchip USBDP PHY side, which are send separately.
> >=20
> > This was split from the USBDP cleanup series. v17 has a dependency on
> > the patches that have been merged to phy's for-next branch. There are
> > some additional Rockchip USBDP phy fixes, which depend on this series
> > (which is effectively also a fix).
>=20
> What is the merge strategy for this series?

I see these options (ordered by my preference):

1: Vinod merges everything; the USB side is mostly a new driver
   and thus there is not much conflict potential

2: Vinod provides an immutable branch with the first two patches,
   USB tree merges the immutable branch and the remaining series.

3: Everything is merged through USB; this would block the final
   cleanup for USBDP from being applied for yet another cycle.

4: Vinod merges patches 1+2, USB patches are merged one cycle
   later and final USBDP patches are merged two cycles later.

P.S.: I will have to send another version for the correct Sashiko
feedback on the DWC3 side.

Greetings,

-- Sebastian

--z4xoeqz7d7xqkqyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrnzy4ACgkQ2O7X88g7
+ppUMw/+IZmalDNrDC3LSfbW/ZyIIGDr+YwPL3ZA9dTFpWBwbX77QSqT3hBTXKiO
Co5D4QcxugfNSIeeoPFM45BpoZ0sNpLWwxiz9d3UdxHXwNMQBLusq0tsDJ8QzCkV
TlrI7ej1U2bZcAq4DyXyqyRpWO/cWjf/JBAucghQFCWzqSW5YsAljsbYQnF/QLHI
y49jW6ltllGr/yC9/+wNba6lZc39SkSgq5lC3mctoUXQGZ2e6zUQbTWKAYr+TLC+
cvFWUQlmymyhELsdGPjhgpPjQndKetVvQVNuZsJ60hqHSNU0ZTSRxaYgl6IM5UPY
dTXsOEQENYlYwetq0ZcOfwHVzM+kybIKqyS5Nm2OKUU0588croKVWhtlq/RHKUlq
72jLZIao0J9KBl8NcAlyehL+taFTmFv3X73W3i5VRaU/A8joulsx0q7Vs8d0qzKa
yizsxRS1gmVCNjR4dSGMmsSy1B+ZReFnZdc6XHLWeNvoWqX+nxeKD6J6frLrfmlq
RoCIH72XqYaxT6jTBMek6Sv/FVlmfJvPGhj66ijzMQbYFrI2ABPdV2ZMtb5KdRdB
/2JFhTzgIUXCP3rcKu9DdUzlmgo2zKEJ4FsZXZnuxp3wjWIcLVSmCcsx7+07uW46
wDT6LWqChtRB8D54e52esmJc/OPnPa28m8RQqUHJFHE2IZ0iMn0=
=Kcbn
-----END PGP SIGNATURE-----

--z4xoeqz7d7xqkqyp--

