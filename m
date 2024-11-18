Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A34D49222
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C3aT8RFdCdTNdeyQreq16da7/I4iz4pcsvKIIFnCgCA=; b=azKJHF8Nx8KgjETgk3FDeA2F8E
	6I7dzdO1g36NBLwP+OQy6JfJ1vcLfzHertMM/DP6E7MSRdgFLsg0T5vurTzcoXuL3NYPAiUvUj0jm
	Xomzv68Acgjfr9tZYjSUUyG5ZmrVjk6jH8tJ1YL78NfXV0SHiqHdW+YzXEaTGmdOQdM5jRCRzRvRV
	EkgJBYPZrQIsLuyrgtQNSejtOuj8MuIMuIBY87vCkL5htG2bXg4drCrXf7aYwQFXzX2zmk48OhM4J
	zj+mSyBwi+TjKPfaVkRgRHZcWACNszT4VoAAfx4YL1WeetBnKemCHszTrOsMKD0EaDUWRdnX0OOkq
	VuXfW73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1vA-00000009bat-1c8G;
	Mon, 18 Nov 2024 13:36:04 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1mo-00000009Zah-1jdb;
	Mon, 18 Nov 2024 13:27:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 491CE6000C;
	Mon, 18 Nov 2024 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731936443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3aT8RFdCdTNdeyQreq16da7/I4iz4pcsvKIIFnCgCA=;
	b=TjnKsS73E0DI6Iz1Q01nvGmPESd+7DxF6LViNdUq0cX9Z0fhcRy+zhf1rsWcq79PUow3za
	RedWyADTe3BipekMwV1ef4XY/nveNr9lfcgJe4eucg+cC4f9nqXU1Al0w+rzpPv1ZlTkL4
	HWjP5twPA9CmE/HK7Q7xBEyU4DBsvYCeyZt+WyrLoXwfeDK9DI6KYjnW7Ab8tBOVTaZS3K
	YNrfEQzODkE3MW1LaAnQM5yksYIAph0J7GYoc5gRUVBOMDwH6TOBPu39VY25t+GtnWI1PU
	t+GuJMr7+z3Ssm8X8RkzTw6qDTocV4cBUXJ4Bck+T4PF979v2jPhGguDTJplDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add bindings for describing
 concatinated MTD devices
In-Reply-To: <20241026075347.580858-2-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Sat, 26 Oct 2024 13:23:46 +0530")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-2-amit.kumar-mahapatra@amd.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 14:27:21 +0100
Message-ID: <87frnoy8na.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_052726_722137_5DE1A144 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, amitrkcian2002@gmail.com, linux-mtd@lists.infradead.org, claudiu.beznea@tuxon.dev, beanhuo@micron.com, git@amd.com, robh@kernel.org, richard@nod.at, tudor.ambarus@linaro.org, conor+dt@kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org, venkatesh.abbarapu@amd.com, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, michael@walle.cc, krzk+dt@kernel.org, pratyush@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 26/10/2024 at 13:23:46 +0530, Amit Kumar Mahapatra <amit.kumar-mahapatra=
@amd.com> wrote:

> This approach was suggested by Rob [1] during a discussion on Miquel's
> initial approach [2] to extend the MTD-CONCAT driver to support stacked
> memories.
> Define each flash node separately with its respective partitions, and add
> a 'concat-parts' binding to link the partitions of the two flash nodes th=
at
> need to be concatenated.
>
> flash@0 {
>         compatible =3D "jedec,spi-nor"
>         ...
>                 partitions {

Wrong indentation here and below which makes the example hard to read.

>                 compatible =3D "fixed-partitions";
>                         concat-partition =3D <&flash0_partition &flash1_p=
artition>;
>                         flash0_partition: partition@0 {
>                                 label =3D "part0_0";
>                                 reg =3D <0x0 0x800000>;
>                         }
>                 }
> }
> flash@1 {
>         compatible =3D "jedec,spi-nor"
>         ...
>                 partitions {
>                 compatible =3D "fixed-partitions";
>                         concat-partition =3D <&flash0_partition &flash1_p=
artition>;
>                         flash1_partition: partition@0 {
>                                 label =3D "part0_1";
>                                 reg =3D <0x0 0x800000>;
>                         }
>                 }
> }

This approach has a limitation I didn't think about before: you cannot
use anything else than fixed partitions as partition parser.

> Based on the bindings the MTD-CONCAT driver need to be updated to create
> virtual mtd-concat devices.
>
> [1] https://lore.kernel.org/all/20191118221341.GA30937@bogus/
> [2] https://lore.kernel.org/all/20191113171505.26128-4-miquel.raynal@boot=
lin.com/
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../mtd/partitions/fixed-partitions.yaml       | 18 ++++++++++++++++++
>  .../bindings/mtd/partitions/partitions.yaml    |  6 ++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-parti=
tions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partiti=
ons.yaml
> index 058253d6d889..df4ccb3dfeba 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.y=
aml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.y=
aml
> @@ -183,3 +183,21 @@ examples:
>              read-only;
>          };
>      };
> +
> +  - |
> +    partitions {
> +        compatible =3D "fixed-partitions";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;

This is not strictly related but I believe we will soon have issues with
these, as we will soon cross the 4GiB boundary.

> +        concat-parts =3D <&part0 &part1>;
> +
> +        part0: partition@0 {
> +            label =3D "flash0-part0";
> +            reg =3D <0x0000000 0x100000>;
> +        };
> +
> +        part1: partition@100000 {
> +            label =3D "flash1-part0";
> +            reg =3D <0x0100000 0x200000>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.=
yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> index 1dda2c80747b..86bbd83c3f6d 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> @@ -32,6 +32,12 @@ properties:
>    '#size-cells':
>      enum: [1, 2]
>=20=20
> +  concat-parts:
> +    description: List of MTD partitions phandles that should be concaten=
ated.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 2
> +    maxItems: 4
> +
>  patternProperties:
>    "^partition(-.+|@[0-9a-f]+)$":
>      $ref: partition.yaml

Fine by me otherwise.

Thanks,
Miqu=C3=A8l

