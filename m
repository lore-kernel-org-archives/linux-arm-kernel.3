Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CB3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QK6p8agz706KN/3GZj0XaZdFE8VXngav/kRCwULJV5s=; b=au/fy5I373z4A0o+uSHm5F38tX
	OuBZYCDiD0pYW+wcKdEIO7btTyYbLnlkUxfyMSmQ7cssCvCra6fFvpaq0N0yh5lYcFkIIpdM18X8u
	CyA2XwUFLrax7txtLfz6p1ZH0MX0AMpZ8IR7MUune1rZ1zRXKWYUx6+3onaztutjic2eJJUhMVv0C
	PLDAv2uMcbu4oeHUtNVnfUQnve+xPoh9SxboPilYaN92fmyq+AVIIcx8McyAthA9GmpA6dYtL1O+w
	1gxnlubTfjLZBHhtZvOT6rfa4TL0KysoCyvr+iCJEoPt2E/JNThAnCuZG5uDTOlZ31/7ywgbMaP6V
	SK+p4rPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYKO-0000000DEq4-1fPV;
	Wed, 05 Nov 2025 07:53:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYKL-0000000DEpR-48NP;
	Wed, 05 Nov 2025 07:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3497541A71;
	Wed,  5 Nov 2025 07:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924B4C116B1;
	Wed,  5 Nov 2025 07:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762329189;
	bh=f1mDiB4caH6T0hXppSMfqh71s7Q4j8DIz8ZDVv+Hh+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQNS0iq6cuzhMlF6th1dXepgkS2JWMiyqs9NLKnCFVzG/nmV29Cv5gyM7cVPQZvOG
	 ydwgZT3huCrlesuE712BNVUL60/aJr3zxfdUDejlZbhHRECwbrWqdNVAmDtzVQSz7Z
	 USLJrREJdOG1WOM3iw+332Yeg7nadVTNm7SdYzxiilIha073kS7cJWhYc+CGXDO1F1
	 jtixhB8/7GjzW8UAQCGCKgfD/YFHsjgVWKGAOSJ9aoY64ufJDZ+3CPab9QxEQ7Z8qi
	 210dzTCFxiQMY2kyqCpsiTXcJWvbzluEAFxWR8RU9oeVcssVSybDXasM3cWe/vQj/u
	 xxe+5GJ1Vs53g==
Date: Wed, 5 Nov 2025 08:53:06 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: airoha: Reorganize airoha_queue struct
Message-ID: <aQsCYoS-cvkUjrMv@lore-desk>
References: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
 <20251103-airoha-tx-linked-list-v1-2-baa07982cc30@kernel.org>
 <20251104183200.41b4b853@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hWmCm/wRFf5QXlgL"
Content-Disposition: inline
In-Reply-To: <20251104183200.41b4b853@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_235310_076611_E775A5CC 
X-CRM114-Status: GOOD (  14.00  )
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


--hWmCm/wRFf5QXlgL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 03 Nov 2025 11:27:56 +0100 Lorenzo Bianconi wrote:
> > Do not allocate memory for rx-only fields for hw tx queues and for tx-o=
nly
> > fields for hw rx queues.
>=20
> Could you share more details (pahole)
> Given that napi_struct is in the same struct, 20B is probably not going
> to make much difference?

I agree the difference is not huge, I added this patch mainly for code
readability. If you prefer I can drop the patch, I do not have a strong
opinion about it. What do you think?

net-next:

struct airoha_queue {
	struct airoha_qdma *       qdma;                 /*     0     8 */
	spinlock_t                 lock;                 /*     8     4 */

	/* XXX 4 bytes hole, try to pack */

	struct airoha_queue_entry * entry;               /*    16     8 */
	struct airoha_qdma_desc *  desc;                 /*    24     8 */
	u16                        head;                 /*    32     2 */
	u16                        tail;                 /*    34     2 */
	int                        queued;               /*    36     4 */
	int                        ndesc;                /*    40     4 */
	int                        free_thr;             /*    44     4 */
	int                        buf_size;             /*    48     4 */

	/* XXX 4 bytes hole, try to pack */

	struct napi_struct         napi __attribute__((__aligned__(8))); /*    56 =
  496 */

	/* XXX last struct has 1 hole */

	/* --- cacheline 8 boundary (512 bytes) was 40 bytes ago --- */
	struct page_pool *         page_pool;            /*   552     8 */
	struct sk_buff *           skb;                  /*   560     8 */

	/* size: 568, cachelines: 9, members: 13 */
	/* sum members: 560, holes: 2, sum holes: 8 */
	/* member types with holes: 1, total: 1 */
	/* forced alignments: 1, forced holes: 1, sum forced holes: 4 */
	/* last cacheline: 56 bytes */
} __attribute__((__aligned__(8)));

net-next + airoha_queue reorg:

struct airoha_queue {
	struct airoha_qdma *       qdma;                 /*     0     8 */
	spinlock_t                 lock;                 /*     8     4 */

	/* XXX 4 bytes hole, try to pack */

	struct airoha_queue_entry * entry;               /*    16     8 */
	struct airoha_qdma_desc *  desc;                 /*    24     8 */
	int                        queued;               /*    32     4 */
	int                        ndesc;                /*    36     4 */
	struct napi_struct         napi __attribute__((__aligned__(8))); /*    40 =
  496 */

	/* XXX last struct has 1 hole */

	/* --- cacheline 8 boundary (512 bytes) was 24 bytes ago --- */
	union {
		struct {
			u16        head;                 /*   536     2 */
			u16        tail;                 /*   538     2 */
			int        buf_size;             /*   540     4 */
			struct page_pool * page_pool;    /*   544     8 */
			struct sk_buff * skb;            /*   552     8 */
		};                                       /*   536    24 */
		struct {
			struct list_head tx_list;        /*   536    16 */
			int        free_thr;             /*   552     4 */
		};                                       /*   536    24 */
	};                                               /*   536    24 */

	/* size: 560, cachelines: 9, members: 8 */
	/* sum members: 556, holes: 1, sum holes: 4 */
	/* member types with holes: 1, total: 1 */
	/* forced alignments: 1 */
	/* last cacheline: 48 bytes */
} __attribute__((__aligned__(8)));

Regards,
Lorenzo

--hWmCm/wRFf5QXlgL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQsCYgAKCRA6cBh0uS2t
rHFAAQDj3Vyre7WUSS9oIsXyUpTR4N2pQmKzb4l2PYBU94jdswD9F7vYAu0DcE53
OvIHIJXFPV1h9xfMXmrM33nb8hU3LA4=
=yrTi
-----END PGP SIGNATURE-----

--hWmCm/wRFf5QXlgL--

