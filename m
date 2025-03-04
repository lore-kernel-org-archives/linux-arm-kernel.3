Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08443C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjCfzkJWAuREuIOJtX7TyjCt6YvD8DU4xNEMjHgcK4A=; b=kzP9o4HfU8n5+0rsgz9g40ks9o
	SOXHZmgnsACDnU+iuA/mt76sxGFXSTsjvce02orx2RqT8DgIT9GzzmPqy3MaxqZarwJ5JOt4AMAk4
	+LR90fZTpI46ibDWVWa7xOBv+TI65QggBOlwYcMffe5CnvS1fqbDgPMY2NCGoAKhTwliu2O1R2IBA
	vWef2O2KBjqEHCjIdIxJq01GeBzv8OsFyWX7f6fAEAv2lYO974SOHUDZ+8GIwClXpJW9d5IdJyD5w
	JuembxGSMAnGmw9SEEsGvLnxupUdxvsatF7YaKA6XCLb/nrx1XX6zSNVerXLcSUVM+PQS8GhDpCO4
	5EhyCu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcj-00000004B8k-0CjP;
	Tue, 04 Mar 2025 10:35:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPPB-000000046q0-0CSc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58002A40939;
	Tue,  4 Mar 2025 10:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86506C4CEE5;
	Tue,  4 Mar 2025 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741083699;
	bh=zjCfzkJWAuREuIOJtX7TyjCt6YvD8DU4xNEMjHgcK4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXg83nEvmhFddBKQkWuL1eWXfxRdJQSPBBjEIKx6iMvMCHtJfBU4Q23zSJTVdpwAE
	 BszUnEoe2edhT+0kPZwoOJg14R5z0Ie3SX/mA+i9OeHr9U2K8U2EReXklhEt5M/oOk
	 YovJCudVjhpPBfnJfv3ytmGv3pWeIBfhjnxQ9DYhlet9AAJTOID2H/SbjjHBdOsPAt
	 SX1chnX26HOg9juOVKHepSvEcy4LvoVNNddjVUYtTgaCZDnWe92vhjeuiBd06S/pAu
	 nxarxFw73Ma/zt03aNkveQ75bOimb0bFDgFtqMt76oWsX99O2CRVwiNP1GdDheJihv
	 jMzMSnsGeVhIA==
Date: Tue, 4 Mar 2025 19:21:35 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v6 3/3] counter: microchip-tcb-capture: Add capture
 extensions for registers RA/RB
Message-ID: <Z8bULwq70CAAQRSe@ishi>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-4-csokas.bence@prolan.hu>
 <Z8awGBW8obpG1QPN@ishi>
 <1604dce5-7be6-4a95-a51c-0c760a6c9a76@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8RKMqNlmenfe7hgf"
Content-Disposition: inline
In-Reply-To: <1604dce5-7be6-4a95-a51c-0c760a6c9a76@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_022141_155254_80831C81 
X-CRM114-Status: GOOD (  17.27  )
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


--8RKMqNlmenfe7hgf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 11:03:17AM +0100, Cs=F3k=E1s Bence wrote:
> On 2025. 03. 04. 8:47, William Breathitt Gray wrote:
> > One final comment: is RA/RB the best way to differentiate these? One of
> > the benefits of abstraction layers is that users won't need to be
> > concerned about the hardware details, and naming the capture values
> > after their respective general register hardware names feels somewhat
> > antithetic to that end.
> >=20
> > I imagine there are better ways to refer to these that would communicate
> > their relationship better, such as "primary capture" and "secondary
> > capture". However at that point capture0 and capture1 would seem
> > obvious enough, in which case you might not even need to expose these to
> > userspace at all.
>=20
> Hmm. Well, RA and RB is what it says in the datasheet, and since we don't=
 do
> much processing on their value, I'd say we're still closely coupled to the
> hardware. So, if one wants to understand what they do, they will have to
> read the datasheet anyways in which case I think it's best to be consiste=
nt
> with it naming-wise.

All right, let's keep it as RA and RA then.

William Breathitt Gray

--8RKMqNlmenfe7hgf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8bULwAKCRC1SFbKvhIj
Kw8WAQCRpc2Qw5kFGL9s5kdxmZ56vP/4YntVebgyQRU1I8GNUwEAk9SWhblz25jK
Owtuglyhwhnmmc2OriiggEtxWMOhfAc=
=ihCK
-----END PGP SIGNATURE-----

--8RKMqNlmenfe7hgf--

