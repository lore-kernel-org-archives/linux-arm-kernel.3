Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79854D29C50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9/XO71AuTElkurTuviO9GF+8SqlkQn89YOGV7iXOpM=; b=j7AYsy4Skbexjh2DAHPny6sMYa
	066HuTaURzRcAArPaOEkprQOGMELe25TwydL/FdKHVvIEzT5CGLQBEs8aK76rVZRE1pm/Q2bkU66g
	/sjNAbSkrfCFFjouVUXgc/+HXnQXV5VX3xAVUj7+UtE3GScT8djfB79/1YMwji6L/XcAOlQIw7sgS
	KDrguoBCLYsrunRU2NIvFe/TbOQJBZP2IajGxiWKmileuH/LkhjsgURw5R15/CEJ4mlp7K0czCGzI
	e1WDiW+WMHaVQlykzjLdsR9jdeArHYaLRE0LeOuo7YQBB3TrSnHgoL8jnhgj43YhKfaFKgnnovwk3
	Cr3LWITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuBz-00000002j6t-3YZX;
	Mon, 19 Jan 2026 18:41:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuBy-00000002j6c-0Kmj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:41:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72CA0600CB;
	Mon, 19 Jan 2026 18:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5D1C19422;
	Mon, 19 Jan 2026 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768848093;
	bh=KAQ8tX8q+bO3qSbrvWwj7NanQMZoHP6DxVRHOxzvxD0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=lHvq6RXDaA9b+mGiP+hfLlVfpLxQoJ5ai6T8IZhmACaN0XFmkEOTqBqp6dtijlIXM
	 jDoins0oUai8B1TsnX0UxGqUfuCJuXuUbwMP0yTquI4hRvkJrXVNYQhDYM9KVPEop8
	 szuuefEpV6lSc6FV+zmlvbtyqM07xd4FZDkjhXOvQbWsCKA+8HjkMWB0lcZYRltPEA
	 hbQ1qIN12Zyogdm9wGgoX3q2WFzk87QUQWddIi1duDGMdKivQtQSbEEHo1A2NG8kZz
	 cbnC4CIylOu7udE5EhG0m5VQYED8aYUYjowNVD7SpHgjSgoq4We5ae/J35gN9DY5sz
	 s9fReWdvH8SNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 19:41:26 +0100
Message-Id: <DFSSBD1SZUDK.Q67HAARLBF1G@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
 <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>
In-Reply-To: <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>
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

On Mon Jan 19, 2026 at 12:36 PM CET, Danilo Krummrich wrote:
> On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
>> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev=
_attr)
>> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>>  {
>> -	struct device_node *np;
>> -
>>  	if (soc_dev_attr->machine)
>> -		return;
>> +		return -EBUSY;
>> +
>> +	struct device_node *np __free(device_node) =3D of_find_node_by_path("/=
");
>> +	if (!np)
>> +		return -ENOENT;
>
> This should never fail at this point, no? Also, can't we just use of_root=
?

Regarding of_root, please disregard my earlier comment. I mistakenly assume=
d
that it would also be guarded by CONFIG_OF.

But I still think we do not need the NULL check.

>> -	np =3D of_find_node_by_path("/");
>> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
>> -	of_node_put(np);
>> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>>  }
>> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>
> If we want to export this, we shouldn't reuse the existing name, which is
> misleading.
>
> soc_device_get_machine() reads as if we return a reference count of somet=
hing.
> Additionally, it operates on struct soc_device_attribute instead of struc=
t
> soc_device, where the name suggests the latter.
>
> Instead this should be soc_device_attribute_read_machine() or if we want =
a
> shorter name, just soc_attr_read_machine().

