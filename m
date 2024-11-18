Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2C8D49222
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WKBfmWwe0K8YK6G59KsdbaDz2+vE4JtCifokD5Jr7zc=; b=mdt1zff2qxjCwrVfL2+4IWJwcA
	5XoYYgKaftWCj8C0APklfXNNB9naoatkJhFpUztASii9E1EF/U9yzsfoLNvFZdnzHWk0zl0FSQ64R
	syImqseHD1DRWVkRkQeFnTnNj6PblXyLRAMwJAZ2RUtds2avadlajJAnh9DmPCBleJ6Hc8ekWgmCV
	fyLj5/mi2cYvxBjWP1b2QjN+s/8hM+NfFBhl5zFSenPJi3HRcYSK9P8PfXStTcuDELAsqGj/E+paf
	CP+1eeZAjfwTi3L3ZVnsCsFofP2DH5aVN0Kz2eQgRZVTJAoMUKRBP0BP+0PP0FIREzQa11wqBlqZk
	3GETXn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1zm-00000009d5s-478u;
	Mon, 18 Nov 2024 13:40:50 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1ya-00000009cgI-2LAc;
	Mon, 18 Nov 2024 13:39:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB8351BF208;
	Mon, 18 Nov 2024 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731937174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKBfmWwe0K8YK6G59KsdbaDz2+vE4JtCifokD5Jr7zc=;
	b=kg3o6mNGQfhtXlBOIcFMtnFqK7OJJG4S/uA++2tR7IMdOehPRj+qTUkcxNKZsF0cG/F2tl
	0ZgptP2PYC9FDYJwuWbteP+AZysqliZ5AjXxkJCmIgsRapeZgllNAdrIMyv9zvYXlwzrRx
	ZqV098zadeIDwrUDGNzQUrlE4xBplfMZD43XGUbtqou3is7C9EK0RaSZhQXtjbCbxLyl80
	9aEGY3YDkivEu5QHWUCM9NWfy8H6dVznjYMubOhNE5+h3OOltp9KVebf4/O6lkzkqvisQ/
	Ywr8UohM5O+ut7DpWgSA96aAkUNb0IorayZKgQZrcFnPpicVpPrZE1EBBPPBlg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [RFC PATCH 2/2] dt-bindings: spi: Update stacked and parallel
 bindings
In-Reply-To: <20241026075347.580858-3-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Sat, 26 Oct 2024 13:23:47 +0530")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-3-amit.kumar-mahapatra@amd.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 14:39:32 +0100
Message-ID: <87y11gwtij.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_053936_867963_41B80B68 
X-CRM114-Status: GOOD (  23.62  )
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

Hi Amit,

On 26/10/2024 at 13:23:47 +0530, Amit Kumar Mahapatra <amit.kumar-mahapatra=
@amd.com> wrote:

> For implementing the proposed solution the current 'stacked-memories' &
> 'parallel-memories' bindings need to be updated as follow.
>
> stacked-memories binding changes:
> - Each flash will have its own flash node. This approach allows flashes of
>   different makes and sizes to be stacked together, as each flash will be
>   probed individually.
> - Each of the flash node will have its own =E2=80=9Creg=E2=80=9D property=
 that will contain
>   its physical CS.
> - Remove the size information from the bindings as it can be retrived
>   drirectly from the flash.
> - The stacked-memories DT bindings will contain the phandles of the flash
>   nodes connected in stacked mode.
>
> The new layer will update the mtd->size and other mtd_info parameters aft=
er
> both the flashes are probed and will call mtd_device_register with the
> combined information.
>
> spi@0 {
>         ...
>         flash@0 {
>                 compatible =3D "jedec,spi-nor"
>                 reg =3D <0x00>;
>                 stacked-memories =3D <&flash@0 &flash@1>;
>                 spi-max-frequency =3D <50000000>;
>                 ...
>                         partitions {
>                         compatible =3D "fixed-partitions";
>                                 concat-partition =3D <&flash0_partition &=
flash1_partition>;
>                                 flash0_partition: partition@0 {
>                                         label =3D "part0_0";
>                                         reg =3D <0x0 0x800000>;
>                                 }
>                         }
>         }
>         flash@1 {
>                 compatible =3D "jedec,spi-nor"
>                 reg =3D <0x01>;
>                 stacked-memories =3D <&flash@0 &flash@1>;
>                 spi-max-frequency =3D <50000000>;
>                 ...
>                         partitions {

Same comment as before here.

>                         compatible =3D "fixed-partitions";
>                                 concat-partition =3D <&flash0_partition &=
flash1_partition>;
>                                 flash1_partition: partition@0 {
>                                         label =3D "part0_1";
>                                         reg =3D <0x0 0x800000>;
>                                 }
>                         }
>         }
>
> }
>
> parallel-memories binding changes:
> - Remove the size information from the bindings and change the type to
>   boolen.
> - Each flash connected in parallel mode should be identical and will have
>   one flash node for both the flash devices.
> - The =E2=80=9Creg=E2=80=9D prop will contain the physical CS number for =
both the connected
>   flashes.
>
> The new layer will double the mtd-> size and register it with the mtd
> layer.

Not so sure about that, you'll need a new mtd device to capture the
whole device. But this is implementation related, not relevant for
binding.

>
> spi@1 {
>         ...
>         flash@3 {
>                 compatible =3D "jedec,spi-nor"
>                 reg =3D <0x00 0x01>;
>                 paralle-memories ;

Please fix the typos and the spacing (same above).

>                 spi-max-frequency =3D <50000000>;
>                 ...
>                         partitions {
>                         compatible =3D "fixed-partitions";
>                                 flash0_partition: partition@0 {
>                                         label =3D "part0_0";
>                                         reg =3D <0x0 0x800000>;
>                                 }
>                         }
>         }
> }
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../bindings/spi/spi-controller.yaml          | 23 +++++++++++++++++--
>  .../bindings/spi/spi-peripheral-props.yaml    |  9 +++-----
>  2 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/=
Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 093150c0cb87..2d300f98dd72 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -185,7 +185,26 @@ examples:
>          flash@2 {
>              compatible =3D "jedec,spi-nor";
>              spi-max-frequency =3D <50000000>;
> -            reg =3D <2>, <3>;
> -            stacked-memories =3D /bits/ 64 <0x10000000 0x10000000>;
> +            reg =3D <2>;
> +            stacked-memories =3D <&flash0 &flash1>;
>          };

I'm sorry but this is not what you've talked about in this series.
Either you have flash0 and flash1 and use the stacked-memories property
in both of them (which is what you described) or you create a third
virtual device which points to two other flashes. This example allows
for an easier use of the partitions mechanism on top of a virtual mtd
device but, heh, you're now describing a virtual mtd device, which is
not a physical device as it "should" be.

Thanks,
Miqu=C3=A8l

