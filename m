Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5C4C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTCjK7GphBpYgmSVOu1ScWLH6UjNwU097e2TCso5clI=; b=ve5qcU6U+GZoHPHZdNnU04y7VR
	/TEu3KJ4mhFz7S845ALrvrfKJaAjij6NJ6PyifpsmSd54wE5lX9gZYPcUcbpisLGv3GWoLrJpzKWz
	Z5NUnakn9LfO5homUZLo+ishloO+WwtWd/ufjSb7WNtbxSxMIjsyzZcQDOuO6E0MnW+TLRDCqYLWO
	5lxoAlo+lI4t/tm5OzC+IRNw0b3DZUbcqevYZHNo/AlZATnHSaDugqtg9yQtujNBQD9aEOVicCxCw
	wiMYkR83fCSlXHgQ8nwogWbMWNAuVfEYSWoW0Qq2FLJbstEEYMBYH6dbsXdlEi1Qa/enCox9Jj1VY
	mif/I33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teaTr-0000000DpoX-24Ot;
	Sun, 02 Feb 2025 13:57:47 +0000
Received: from out-176.mta0.migadu.com ([91.218.175.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teaSX-0000000DpeS-2QP1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 13:56:26 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738504568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTCjK7GphBpYgmSVOu1ScWLH6UjNwU097e2TCso5clI=;
	b=I+VvQvFBpA2cUT9zyvjYyK8BieeLsCdC5A9qZSH08JTKHKQWomZq/C7Qhys+xvEkJlt9ny
	43qaRft0e9kotHlF9dHeT1Oyrpu+rMtAyT7NA5X8aVArVoMff8Q1/0fNzRkF4goV3+uI3f
	TQq9zuWbyAi/sgd6gWo0Oe7T08aA3YKUt61aVBEsnAhgiPYU4VNNTFSEqAzsWwPgizTi5u
	K7h0r3R4CDzE/I1b4PdMd1DOMT6wvHzFOAFqZrlmkbIhsRVz+SqsyFqqtQQlxufBTx6tpw
	D32Fkj8jrXNaM0NSjm0cGwZdBRTI9D7JV1uFHDG/xt4YPUEH2wqk2+vdpEq0NQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Feb 2025 13:55:21 +0000
Message-Id: <D7I0F3OMXALB.1ZT1G03JTKSEZ@postmarketos.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
 <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
In-Reply-To: <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_055625_765160_18511DF2 
X-CRM114-Status: UNSURE (   9.45  )
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

Hi,

On Sun Feb 2, 2025 at 1:54 PM UTC, Krzysztof Kozlowski wrote:
> On Sat, Feb 01, 2025 at 07:30:43PM +0000, Ferass El Hafidi wrote:
> > From: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
> >=20
> > Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
> > xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
> > few minor differences.
> >=20
> > Signed-off-by: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
>
> Please run checkpatch. You have from/SoB mismatch.

I don't see any mismatch.  Maybe it complains because of a spurious
non-breaking space?

Regards.

