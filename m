Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA47CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq8xcuLXF276w2RR/xFipRFelro2Al8zioMdpDSCLdQ=; b=OwxfRMoE/EjmlExSdY9HbAXkPU
	PVH3qU/sX2R7rG1GNm6KgV/FCA8DoziQKoJ+TxD8g2lKid51oJ22qoR7cuyQ49/KcMBzt0HmJ4ZUg
	DE7oc2iM0LsA6sifF6iygf0S8SHTSRz9UTlNST4i1O87WNy3pW1uvcYCeJ/vBY0lYxJy3VhAjozoP
	j5nm8Okvm2vI6YySilQ3ZRhXu3fWrReqHjmjnEzHSbdsOll0E5tFC7w6vF2Da4ZTWCdc+3e376xWl
	MyW++LUHNkG+5Ue77QUdl4shA8K0TU8QRI7C5hnRoBCCN218xE32/PRpnJHTbhPBtJL10ch5IMEB+
	HPphOwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upK0p-00000001Yns-1ZKb;
	Fri, 22 Aug 2025 05:08:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCnE-00000000f4C-3bOG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:25:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3752F5C5A24;
	Thu, 21 Aug 2025 21:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD5AC4CEEB;
	Thu, 21 Aug 2025 21:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755811555;
	bh=+Q8r/IpJLSBFIgkrEyE128JdbLX+nx0vcUqeZBoKrNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD1PJctAFEJ69To4v41TtyclO/w7OOhbzdeShybQoY78IUYgi9InihindHlQPz1mS
	 RDWYt+k9zmChtVD2neeSodbbnaxjWfLFMJJRGOt0J1JJcPjyYAtY5eG1ZUoIj+wuJ4
	 6ldPPkw1V+FD1dSlPxZiGt+TI3XA/wB99EW0kfmMrtqh69XokRelVhjNpuTXxju5e6
	 ZtTgjgUYLYQe7TiGes/+yuss9HqB3fQsC6J7xRzfh+EKBAC1GzDXxo/1xAgQ8De1QF
	 KrSuFURxk0QIlT4gCka0fv/vjpfjp8nvDmKIrcPRizyBJ4BJhptt2MdCn9AikQaCqz
	 OySzkfFMZy/hA==
Date: Thu, 21 Aug 2025 22:25:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 3/6] KVM: arm64: Forward GCS exceptions to nested
 guests
Message-ID: <e1c3bee5-6521-4dbd-a207-4ec3e4ff19fe@sirena.org.uk>
References: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
 <20250820-arm64-gcs-v15-3-5e334da18b84@kernel.org>
 <87ldndk5c2.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="llrqpkiErFSNNE6q"
Content-Disposition: inline
In-Reply-To: <87ldndk5c2.wl-maz@kernel.org>
X-Cookie: Warp 7 -- It's a law we can live with.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_142556_935122_D96BF575 
X-CRM114-Status: GOOD (  16.85  )
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


--llrqpkiErFSNNE6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 20, 2025 at 11:15:25PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > GCS can generate exceptions with an EC of 0x2D (GCS Data Check
> > Exception) when data validation checks fail.  When running a nested
> > guest which has access to GCS such exceptions can be directed from EL0
> > to EL2 and therefore need to be forwarded to the guest hypervisor, add
> > handling for this.

> Why is it so? A GCS exception from EL0 should be routed to EL1, no
> matter what (either this is an L1 guest with EL1 pretending to be EL2,
> or this is an L2 guest that has its own EL1).

> Can you describe the case where we need to reinject the exception?

I think I'd got myself confused while looking at the HCR_EL2.TGE case
thinking we enabled that in some case.  I can't now see what I was
looking at there, pretty sure I'm just mistaken - thanks for spotting
that, unless I work out what I was thinking I'll drop this.

--llrqpkiErFSNNE6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminjt0ACgkQJNaLcl1U
h9DhBgf/W05P5KDqWX/JqdJjThleyVH7QJ1ZUGO+5QIqs7ZnsqlHdGl/KPWFFIc7
jqQBGtJ4BPARkr60Wcq/G1DI3kuGD/61a0PktBxAAMZvtfabDeRgKftQVMrBfa/U
zf88E/l6oAFCZQClYX4xprBoUSrG71rk4QemvoJrEbwkHXFIBptOEkRXPdWBcaHP
rjKiN7sSW6HxLsTuLXlLVN66V7D3RI03Fyw2Sj17wofhOUEd+5P5bET5RLeXSxRN
hEYPQqaF9t745NIwsmvD8b60HGUqOdEfAG9ZO+cW3enju+765GAqlajE8vMLxbeb
kNvV7xm23iBrTHRFUXxDOwhXIb75+g==
=3kBM
-----END PGP SIGNATURE-----

--llrqpkiErFSNNE6q--

