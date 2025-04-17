Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BEAC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0w7LJABQbGyQlH20LFc6VsfC1rcqxNhJ4w+NoDyZco=; b=x/bstCNLDsQmoiUMbfN3BniK2I
	JKQJ8VeETFEWl4LBUa0oHlHKrGwmB6A/hjvvDbWMYdaHxXFmw1rBMydwhGpRLKzK5cTAm2T5WkEqH
	pW/Alq5HyuerwdjL/BK9nzDx3xYMxJORfcH/gmFfO6mzXHkcQC9DgKBsht75G1zvulKGsJ5q3QRWv
	A1cRfbWOZ6xPzBr8F6fKvjAXTA8QTa9E/zGfufz4Kuq6mZMmMCcVw6Y7OPG24b8zGyXc/Y+2SWcrk
	GM/CwhqqVo68ysRnwadAWOX7Qy2CcVOzmCNvuVDvlpGmZWV5R5nKDrf9+CM1ksoF41AsXCk7NYTWB
	9auXT6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LlG-0000000CVBe-1tLs;
	Thu, 17 Apr 2025 09:42:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LjQ-0000000CUxO-47ck;
	Thu, 17 Apr 2025 09:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9F486842A;
	Thu, 17 Apr 2025 09:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9105EC4CEEA;
	Thu, 17 Apr 2025 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744882828;
	bh=oztNe+62TOePl7PmTJB2o1KTEoJOYLtNxh9fbyr6Y+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJRO9yglH0/zdjfhzDeZN8sEkS11lGoMRTT4JXFciq9R5kPYpEEEFiwJp+jpsBnlk
	 rbQ/onI1l1Kf08rTseJo6WS7E+0kqc8jdREOERth9Ho9aTWiOO7F3n9KBCUCXohuky
	 j1f1G+tExB8dTRz7LM/uxgWccBwXpe+2fJ2g4zVPDMCRpvybZv9ffFFCZoZIOhccAZ
	 BUpzGNMrPS64FVWqHgvumf+rx8IDpt9gjrD/nxMXqGMACxGEnWkUtSDRCoeMIEl+9c
	 auwqT96IckG9jDk5mG7MHDR63Vnzp35uNO2gLk8tGWbwj0gdaO8FwhJ/B1qDNDmvb+
	 PMKw1I+5s9A9w==
Date: Thu, 17 Apr 2025 11:40:25 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <aADMiRyhU_Qkc7qn@lore-desk>
References: <20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org>
 <20250416154144.GT395307@horms.kernel.org>
 <Z__S_m9fBEKmoos1@lore-desk>
 <ba5b4313-6e42-4340-8301-239dac046424@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I/38EiJkfegtg/Bb"
Content-Disposition: inline
In-Reply-To: <ba5b4313-6e42-4340-8301-239dac046424@redhat.com>
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


--I/38EiJkfegtg/Bb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 4/16/25 5:55 PM, Lorenzo Bianconi wrote:
> >> On Tue, Apr 15, 2025 at 09:27:21AM +0200, Lorenzo Bianconi wrote:
> >>> The official Airoha EN7581 firmware requires adding max_packet filed =
in
> >>> ppe_mbox_data struct while the unofficial one used to develop the Air=
oha
> >>> EN7581 flowtable offload does not require this field. This patch fixes
> >>> just a theoretical bug since the Airoha EN7581 firmware is not posted=
 to
> >>> linux-firware or other repositories (e.g. OpenWrt) yet.
> >>>
> >>> Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
> >>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> >>> ---
> >>>  drivers/net/ethernet/airoha/airoha_npu.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/e=
thernet/airoha/airoha_npu.c
> >>> index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..16201b5ce9f2786689622=
6c3611b4a154d19bc2c 100644
> >>> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> >>> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> >>> @@ -104,6 +104,7 @@ struct ppe_mbox_data {
> >>>  			u8 xpon_hal_api;
> >>>  			u8 wan_xsi;
> >>>  			u8 ct_joyme4;
> >>> +			u8 max_packet;
> >>>  			int ppe_type;
> >>>  			int wan_mode;
> >>>  			int wan_sel;
> >>
> >> Hi Lorenzo,
> >>
> >> I'm a little confused by this.
> >>
> >> As I understand it ppe_mbox_data is sent as the data of a mailbox mess=
age
> >> send to the device.  But by adding the max_packet field the layout is
> >> changed. The size of the structure changes. And perhaps more important=
ly
> >> the offset of fields after max_packet, e.g.  wan_mode, change.
> >>
> >> Looking at how this is used, f.e. in the following code, I'm unclear on
> >> how this change is backwards compatible.
> >=20
> > you are right Simon, this change is not backwards compatible but the fw=
 is
> > not publicly available yet and the official fw version will use this ne=
w layout
> > (the previous one was just a private version I used to develop the driv=
er).
> > Can we use this simple approach or do you think we should differentiate=
 the two
> > firmware version in some way? (even if the previous one will never be u=
sed).
>=20
> I think it's better if you clarify the commit message. I read the above
> as the current (unpatched) code will not work with the official
> firmware, so bug addressed here does not look theoretical.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> Thanks,
>=20
> Paolo
>=20

--I/38EiJkfegtg/Bb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaADMiQAKCRA6cBh0uS2t
rJ67AP9cbyNfuXlCcIDCbznlmoFvGbjYrj48AEnIBLv7nvvs5wEAsKnFcqsQrIR+
qejGeo2uGi0ksWaTIT+CaDF6LBPaBQ8=
=GURb
-----END PGP SIGNATURE-----

--I/38EiJkfegtg/Bb--

