Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D51103A9AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLc1KzNKSJhv+RREA8bTvjLUxDDu8WkwkOtqELZ4RFg=; b=R3/XVfXd0/vIW8LXbkObb8l0Dp
	rlT3KMBEg2DM503zjvDcz+V0wxjHulx0SCWZjqyCQciNXTeV8yXyjmROR6xlvdzMuIFo0uPbMmjr1
	K7FFgiDX2b/vhq5WwOSB9oKfNdUpNd0B5LBaddcz1Xg9XP2mU5OAi/bpO3q8AS83scMs6DiyHJ2Ha
	BWawYmrHJaJB80UCqKV0RUpMfPsmJyO6HrlHfcXJ2KWuLYdLlIJ5stPxM+0+QmwmDCbX97EpVQqaL
	E9x+ODIcfiDB7mFCRUoJUn4K/uijUuoLEsCxRXDeAyLy/rsCbIkMcp6ylBDFPM2ZckjW3xQwFYxDy
	LsTCxd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MgJ-00000003IET-358N;
	Wed, 25 Mar 2026 11:45:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MgI-00000003IDx-0nsJ;
	Wed, 25 Mar 2026 11:45:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B649A43604;
	Wed, 25 Mar 2026 11:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4ABC4CEF7;
	Wed, 25 Mar 2026 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439149;
	bh=mLc1KzNKSJhv+RREA8bTvjLUxDDu8WkwkOtqELZ4RFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFQdlKrgLhG6g84BnNQrLcUHrijuQemWmuklg/O1TaCFXK1DKJu9oOmjRmwhO3Q+q
	 en7mDMIogOjBX0+ckfY0t0bB1mGFlGkCzY3GAvqxhLYkZR7EhhuZ3dcRNHHTqv4VlF
	 tJwwMSDUFxUWEpHhBij/hRs/rpBTdnjqRt7R5e8F8mB38UNuGFoiwEBZ4Wy3ACmPHw
	 mZ695SP2Pjui0SSfsUsN5jQR6KEGbO2IYTQdBc/Ptk/Nrl+cL/i646XXmMQIWg6Hkl
	 KXkC+J1SX9bMmLKFE2xJSBn8iaxTRpo6RYZQPJ/t9VI0UVuwpekkRfii+28UQ8nh2G
	 GMgkwnV1jikdw==
Date: Wed, 25 Mar 2026 12:45:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Meiker Gao <ot_meiker.gao@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bayi Cheng <bayi.cheng@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: spi: Fix clock-names definition
Message-ID: <20260325-vagabond-magnificent-polecat-624596@quoll>
References: <20260325031900.2099969-1-ot_meiker.gao@mediatek.com>
 <20260325031900.2099969-2-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325031900.2099969-2-ot_meiker.gao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_044550_271015_25274675 
X-CRM114-Status: UNSURE (   9.11  )
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

On Wed, Mar 25, 2026 at 11:18:54AM +0800, Meiker Gao wrote:
> Update the device tree binding for the Mediatek.

That's too vague. Everything is update. Say WHY.

Anyway, you ignored multiple feedbacks, was spamming us with multiple
same postings and still did not improve. There is no versioning here, no
changelog, even subject is using incorrect prefixes.

Read submitting patches and other guidelines before you post, because
you are way past the point of making innocent mistakes and this looks
like wasting our time.

NAK

Best regards,
Krzysztof


