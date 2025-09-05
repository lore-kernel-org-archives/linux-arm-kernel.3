Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9578CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4JMOWDCtaWn4IWv+Qg9bqYdXONUBAHh8WRaRowDs6s=; b=zqM9vYETTXnRTkDGhLFZFlrsgY
	Ky7Is0MffFGmHlESLqPzm3M6fNJEBW7X8pzTRtNFZ0OElefJSPB4OQ0ac822GKOOhN9emmaHM/rH2
	LIiRbgoyg6dyjPEyyh9eBP1RA8zyxA4eWs37lVwafg//bjXMQoP+/48YYShtFa4Nn2g710/WG899H
	w6tqIwO4z/wfLyOKUu6pZzspoQPA+8kt2NxZoDjRwJAvjSpXdY9mDRnWlR41SeD5XQLcniO6n6OeG
	mw9thSu1VSszbwRrSDJ6eVL28+qLiKkaKR68wom+csXU1Wc0mpOcsbMwv6bbf/9M+G1K2RxiQOf1r
	i9i8TegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugWR-00000005TVv-1Icu;
	Sat, 06 Sep 2025 00:11:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubEd-00000003obv-2SQP;
	Fri, 05 Sep 2025 18:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AB1D416B1;
	Fri,  5 Sep 2025 18:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE429C4CEF1;
	Fri,  5 Sep 2025 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757097151;
	bh=e4JMOWDCtaWn4IWv+Qg9bqYdXONUBAHh8WRaRowDs6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUtojZFfxPu8z3gD7wiOB66CARaIwLsYkUy3gjCrgMpyZVgcxewDZMKVj8e5UAa2X
	 +HhOGkTGVs+WUqWWIy5ULM0j6/BhVLUL3s5fW81Un9h8AtnqrEXIErhW22zGgyr38u
	 hGh8n9vAx5trCCECvpeVi6q0fjY+5B2CgtMN4uqTRSyJQ6WKlF9pT9OzsYsEFOhaSl
	 QK2wr33IGQdg6hL+6sHohs7jdiqCr+uC3SBEUzC2Imwyx8DCLDGSHfRReIw7CprZr1
	 24bR6LWwOJySdfP8rEueEz+q9REj18vjNRqqkuexNB1CIgt3JwVZBUIpvdSzigOuYs
	 m8E6l6C4TcyKQ==
Date: Fri, 5 Sep 2025 19:32:25 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"hongyu.chen1" <hongyu.chen1@amlogic.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: keep alphabetical order
Message-ID: <20250905-stew-removed-db191517cdf5@spud>
References: <20250905-pm-fix-order-v1-1-3596e03d66e6@amlogic.com>
 <20250905-vexingly-crudely-36f9e510e9c5@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ArYkgdtypeXZuzdN"
Content-Disposition: inline
In-Reply-To: <20250905-vexingly-crudely-36f9e510e9c5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_113231_644276_9BF05CC4 
X-CRM114-Status: UNSURE (   8.44  )
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


--ArYkgdtypeXZuzdN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 05, 2025 at 07:31:33PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Actually no. Ack is dependant on $subject being scoped to the individual
amlogic binding. Perhaps the subsystem maintainer can do it on
application



--ArYkgdtypeXZuzdN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLssuQAKCRB4tDGHoIJi
0pLHAPsGHxXqiKWNNentQqgjeU+9z7eQFW2LYOQzgEYNCmyDuQEA8yzY+9TrObfw
cZ4RAaTfqlgFAYVSR2jknvD3eFTKJwY=
=To+s
-----END PGP SIGNATURE-----

--ArYkgdtypeXZuzdN--

