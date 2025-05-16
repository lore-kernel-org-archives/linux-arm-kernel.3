Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AE6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAgXw+YQbxhRZFYnuc77tuWCxwF6uk296zESBMcf93o=; b=N0CtpK+tXKNyaRAQzaCkJigORJ
	5HNjmW6WkLEG0AoYlXRHzAb+ozz/e97oOfZxZpgKSoH6xA6l/PcGWotzYBa5Dg9r1eiDI4/+3wvO4
	RANOKTwmKk24NmZbkC4dGz9tSQezFS5dDZzmLp3vPF6abwPFnXS8JJoI/FaBYki5kQPZNvRiWmS+G
	juRu8KftEbXQAQqitrFXA6t6FbYSjYj1P4kDe2oHHO4GpsMwoziyo2IELzif1shFu2Ahxahpr4Gyu
	Duv/KpQY7w7elDMgK9zpBpSCc62BlQZzSto08wB2jgomEabJz+87rH1frJXtuJOVp4JVEVcdzRtp+
	ov3Nl5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuFE-00000003O2V-1xwE;
	Fri, 16 May 2025 12:32:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuD5-00000003Nak-2mre
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7361A4E54C;
	Fri, 16 May 2025 12:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0397C4CEE4;
	Fri, 16 May 2025 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398642;
	bh=nAgXw+YQbxhRZFYnuc77tuWCxwF6uk296zESBMcf93o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9cgtuN4dV9cv9KL0jsdldegpsqMVYRi6eZV3mOP1Jy5Hb2egXYlP7hSJLmrROswg
	 4999aw07AEPYFUIrGtJCLmuRNom6rrR6BY298OZPGmeR/b20AY+eptGf2kEV87UGuB
	 UyFJyt13QmLAGHzj533y4H1f+A11TZVoCgwwOwBADYKF7/mJINDok+yM80hWhlUujr
	 3wbsJvFvaAH6717VbShpNegIUb0hs4RpLs8oyrhx8G9UMOnSsNn5PcVIGTcRzvNV5n
	 z0oKkLLY2Qfzawa9Nkmb8Tm6+VaLhnvtWoRuK9M9YQctiubcFGCUXXvPs5X9lUKd+C
	 5P0et9augmfAA==
Date: Fri, 16 May 2025 14:30:39 +0200
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v9 6/8] regulator: bcm590xx: Store regulator descriptions
 in table
Message-ID: <aCcv7zfhnN02qgNJ@finisterre.sirena.org.uk>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
 <20250515-bcm59054-v9-6-14ba0ea2ea5b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FmxIo2yjllB2LOAn"
Content-Disposition: inline
In-Reply-To: <20250515-bcm59054-v9-6-14ba0ea2ea5b@gmail.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_053043_773747_6C41A2FF 
X-CRM114-Status: GOOD (  11.60  )
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


--FmxIo2yjllB2LOAn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:16:33PM +0200, Artur Weber wrote:
> Instead of filling in the regulator description programatically,
> store the data in a struct. This will make it a bit nicer to
> introduce support for other BCM590xx chips besides the BCM59056.

Reviewed-by: Mark Brown <broonie@kernel.org>

--FmxIo2yjllB2LOAn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnL+4ACgkQJNaLcl1U
h9DALAf9Hf0JBvTfw7cBAVrQsNt7AOoYFV11noWtTB/xwe111Eh0jS+3Bfo+cKGY
f7WJQq//NR/JZxdINBfYT9JJGd79mD22CBnCjYc2qZBft12vFP3mQNAtg48t0f3S
yCkObJ0tJQSXI+T9oYzsb+C1TQUIIyeqtgCqLTe5dcs75XEFsrAdko23kz6U1H58
b2tMYg83p1JdTKqO1ZwJPYU56hIvMp6VCBv3lFbPeIfU41Sbg9HQDchMkd48K01j
h0srVdNW4tFdLHyXP+mz8vk6HxKv0Bhc1wYbte/SDLHNrAPZ9ubQY7254WKSNYZH
IvEadrR5HLJKJDgOu+72B8h2MG5W5A==
=juSo
-----END PGP SIGNATURE-----

--FmxIo2yjllB2LOAn--

