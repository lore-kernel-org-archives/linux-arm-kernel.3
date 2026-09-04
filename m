Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7338AC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BmHvGQLYZI+8mQ/4U5MBn9Dm6Gp3QoBS0UZAfGx3jk=; b=vwpa9EMHJNr5d/0dR4r0FRjOvv
	jO/hmYZsbyJ/Fssfi+N1WIZ5N1TLIQccAM5e9t1AafwUITTgiSWyhCqP84vQy3TTZgsS+IKPe40Q5
	kAiF8rmbgMfC1U3XBfugO5A83gjlmLrPgSpW2facejmtSMVygF8TdfnZibJrzqBStuKGLKYpJCSvX
	5r3ViDuRJcHuQ/q5/MSji5eet4G90S3/EbIFCC07tu9Z7OewS6LitN8sg8Yy+zW4bOaDglnswpBlL
	+hsDdOXz9qnm6cbzrGCI/U+/8bFVK1rr52eE9t4Kg8pDX0F1LxQcFrBzmzIuN5XzyC9j1BFZZ+Ohh
	HpsYZY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VZX-00000002TwX-2sD1;
	Fri, 04 Sep 2026 15:11:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VZW-00000002TwF-2zop;
	Fri, 04 Sep 2026 15:11:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FF8941A89;
	Fri,  4 Sep 2026 15:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA2F1F00A3D;
	Fri,  4 Sep 2026 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534678;
	bh=1BmHvGQLYZI+8mQ/4U5MBn9Dm6Gp3QoBS0UZAfGx3jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=benIKmJIWnDDg6vX7aZDzRoBEOvJt1wnfhWV5a7jv2XxrapXFCIqfd0cSarZ/VMLR
	 elnKEsDjgdryY8go11rGmHzWV6p5xSjabWHJGkuXHN/Qu9O6HKGIQdKqGDumkInQw+
	 qoYh/ZYtSk9hT089MzlTtNwSjaWe+5ZpR+ecz/Nstsepe8MGuABRGLEtIecxzJ3GyF
	 tRB/96Agw8WaEzpqDa71GxxuLhWKKVNmYTLNysrK3Y6+ccX9uZBt7W6QF0s8qB4yjA
	 EBSR20Zc6bXoob6uuoJ3F/HScYhcEHdtQvwV3z6t3g/F/8FINhR+Qi4Pw5oyWpeTBw
	 QlNoKZdOhDcVw==
Date: Fri, 4 Sep 2026 16:11:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: npu: rockchip: allow DVFS and thermal
 properties
Message-ID: <20260904-delouse-silicon-e9b6286b7e1f@spud>
References: <20260904130858.27803-1-royalnet026@gmail.com>
 <20260904130858.27803-3-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bUE3pkSw6P9WMgiV"
Content-Disposition: inline
In-Reply-To: <20260904130858.27803-3-royalnet026@gmail.com>
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

--bUE3pkSw6P9WMgiV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bUE3pkSw6P9WMgiV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprfkAAKCRB4tDGHoIJi
0mLxAP4/WUj+Dtl3eGbLZM89xW8dZJDvW1nzmTMWTbHfgdnpGQEAy5Ei1DSvANlI
Gzz2Nn+fBRATNnmyqLIPXMe+R23uxwQ=
=SdkI
-----END PGP SIGNATURE-----

--bUE3pkSw6P9WMgiV--

