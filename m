Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF54ACD98D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vv64cd8SFupwFJKr3VBCTmOwr/u3q9lkm1htCLlUAM=; b=Ppkkh46b/Ml8jEl2taAqEfZvYD
	QjUM6LN1DkytxoTNDsU5ong7S1bJMoODDqqd/aB0NaobbBxS3R6kpOZSfH+kCOAfVuumiE/pGwDkn
	51rjDWjlKffTIWIY1XS35TfOb6q8QC1vFxaRUos+ePvExuhxQRE1ou354UYtaixdpCSYhxvx5H/Hw
	Sl9s5Up/h9pJNzrRMIrNwtcl8/cFLmjzJ5mOoT+sHieWZhYxN5mSPvdReStgfmFVM8EGd6BqWtKcj
	NXNARfCIFkyWGo1XnxkdJBbm9hZN5MbWI5C6KGlqzQpO20QUmeyaoObmPzLshgDv87oSeJQ2pZoGM
	2+Y4fxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd3v-0000000B0ix-1gey;
	Thu, 13 Nov 2025 19:32:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd3t-0000000B0iP-0jxy;
	Thu, 13 Nov 2025 19:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D397143E63;
	Thu, 13 Nov 2025 19:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C864C2BC86;
	Thu, 13 Nov 2025 19:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062372;
	bh=3vv64cd8SFupwFJKr3VBCTmOwr/u3q9lkm1htCLlUAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNMf4ZypLQh+Fsr5mhzocSGw0Gu6sA8b+vnK7Whe5oIf8lPKTCfK57Wr3Bw5bb0ro
	 2Nl0vgNcSVDchF5hO4oD8gUXKXgNPWK78JM3kHjDli1F8p8m1Rb5zmONzmrVQFfjT4
	 TTiF/O/8+DpK0WuZ/ycYZ1y4naJHUIZfH7uqecoUIw6D1KQVPWK9FZ5c7v5tVRNT++
	 d/FDKP13+Mf743dJAys5hbrdNc2TkLwY/vzblXsVieK4NoKGlBNy8Cg8PIlXyqcOPu
	 dby1YhYI/Hnpm/APYoSyblkpUA1f2Ap72KWjg2BoyVhLfkxhSq/x1EAFyzyBP71/wF
	 Kxdf0S6GH2b+A==
Date: Thu, 13 Nov 2025 19:32:47 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, sean.wang@mediatek.com, vkoul@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 2/8] dt-bindings: dma: mediatek,uart-dma: Deprecate
 mediatek,dma-33bits
Message-ID: <20251113-consoling-footprint-b0e973dfa43b@spud>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
 <20251113122229.23998-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LYAF0Q9LqRdx+kPX"
Content-Disposition: inline
In-Reply-To: <20251113122229.23998-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113253_229334_994008B2 
X-CRM114-Status: UNSURE (   5.42  )
X-CRM114-Notice: Please train this message.
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


--LYAF0Q9LqRdx+kPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--LYAF0Q9LqRdx+kPX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYyXwAKCRB4tDGHoIJi
0gE7APsEtqK4GXeGyZLPaN983rSnnZc0g7pcx03yHX2KSrOmmAEAvhnPZOC+Lolj
VoozhY9jDuDBsJeppDefVHWStpF+3wQ=
=9foT
-----END PGP SIGNATURE-----

--LYAF0Q9LqRdx+kPX--

