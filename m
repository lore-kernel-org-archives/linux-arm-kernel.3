Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F21CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9Pc+PAihK6OLwpz+8d8MSEkFl3S9CIiabPdvcTk9v8=; b=0SZLSsXo8VTIKZFiYHHPUsLlDl
	FiE7k1wAhG+HXzMfUQ8cU2iWjc0sPlbeffoPWvucCNxSi1rSv/uZjEucsE0L+pLAhMbLJgitPmavZ
	n3VgEp/hLfCNQdVgY0qNIaQmF4Hm01EDysAluTXPc2h7g48R+1lec0mm37qlahQROpSuzaCY6/xkD
	rSnQ2MB/UCm7GKHyoGsao7Nyh5MqFaWWrZ49njiK9ZJrR3t7kKhMpjsEbo5IUhj2mjxFis/3D5Seg
	t55Dy390dpTszTQxSaQU8QXMK7+S0vQJyHzvN2CRn6Qzj8WtEkzSMr/OlV99QwzQhTDiFYTKjjmj2
	B/tjCBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfQ-00000004Ujj-1WES;
	Sat, 23 Aug 2025 09:36:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV1X-00000003Cg0-3iVD;
	Fri, 22 Aug 2025 16:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABC345C7146;
	Fri, 22 Aug 2025 16:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63074C4CEED;
	Fri, 22 Aug 2025 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755881634;
	bh=J9Pc+PAihK6OLwpz+8d8MSEkFl3S9CIiabPdvcTk9v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdwyCWqjwop9mnpY+v/oAFKE3edAqepKLXQyUCy+vtjyb2zYUljXfdkuHphvlPc/I
	 +Kl51TGtHpjk3Q3OVh2CV1ldi5R2qJd4CVYGz+9gjIJ/h6B2VwEOOlD9zdrya8lZQG
	 WvoLJ7goU1Ys8sswVHb4SvXRjUCcd+5yIoqQwwbt+nqNO64RbJFETce6bkOgePh3Qe
	 7ydnMdv6M7Hm3ZEOgqrmWoevoiC74nZ0Q95wLSJeqmYxJ/IPacNb/mqzswQZXXW7XT
	 8JSapDmG0hbvchp5AX5pg16yrniIRKfg3uktLojhRtWVUi58jkIOzXfay+7TarTS3v
	 lr1WlxWh2e/1g==
Date: Fri, 22 Aug 2025 17:53:49 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, "hongyu.chen1" <hongyu.chen1@amlogic.com>
Subject: Re: [PATCH 1/5] dt-bindings: power: add Amlogic S6 S7 S7D power
 domains
Message-ID: <20250822-gala-contents-4f16558dcd68@spud>
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
 <20250822-pm-s6-s7-s7d-v1-1-82e3f3aff327@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+Hljh53Ey6WSwxk"
Content-Disposition: inline
In-Reply-To: <20250822-pm-s6-s7-s7d-v1-1-82e3f3aff327@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095355_957121_F9CF0056 
X-CRM114-Status: UNSURE (   6.67  )
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


--/+Hljh53Ey6WSwxk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/+Hljh53Ey6WSwxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKignQAKCRB4tDGHoIJi
0mN9AQDE4nlsgOE9D3gmaacJI+/i2rKetx2wsfYbDyeZK3FRzQD+NFyZz67qC78e
nDNCV2Nrhip+LAe9vQttb4M7UTiWxAk=
=MTEB
-----END PGP SIGNATURE-----

--/+Hljh53Ey6WSwxk--

