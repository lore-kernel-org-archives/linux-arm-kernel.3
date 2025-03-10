Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5119C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFcHAHlg0AjUproA19pwBB99GTkTuaoZxbvNqhe0Z4k=; b=m9Kro4x6ln2PHl9OwbOAqwKhm1
	QnIrEXEob6TedoSl3n0LigBmTvR6QKuwsXcVH9lL+xGCUNpQrLCzgWqkutfhe3jZV4FveEFC0jUuz
	AMSuIb0Kyelcv8jDb/vWVLRB/yKiPoAkaWdZx4fDQt+j478bulXnzsJlPY5lElxvMac5Et8xjfh+b
	efMLbigNlF3XD2H8MiDj9eHpu87VpWJs8pOb4VMgZXoj9YD6SXkxXyDJpb3NEWzxPViKzbI/DzbHB
	RtQ5HCXHBy0xzKH7lbrt6pozsNnTMVvwGhhRXybfsFRIhUip38+fxKljHBqKTUT5CEvkkVh6OldWD
	zm+AwYHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trimF-00000003jS2-0rub;
	Mon, 10 Mar 2025 19:27:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trikb-00000003jLL-2rKZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 19:25:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6862D5C5C6A;
	Mon, 10 Mar 2025 19:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9842BC4CEE5;
	Mon, 10 Mar 2025 19:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741634718;
	bh=HiJOVJUbPj9Y5EXs3EtkfouEzE6hMa/6Du8rJbM/8EI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TI1r+x0FIda8jW33SCD3Gv5Oz3Fcych+C9ZVqYndpSHwUYvX+I/aAlBs9Owiifmmx
	 /Iu63dqXpopc8YBmK80269Dcs104vl1hmZnDLqLwFPyAT+Pj8e5ehGrIowBBd1vjN/
	 SIKvbM/nqcvQSOfWE9ST4IKanpPHDFxX04whzNpCFzYwzEHSsakIbsLURs5bEeOCzC
	 hqaF0mW6r1COEkHffTA1PKjcWH5qcytkZMeXqh8M5lVAy7JZ/xMXucG87Md231yowD
	 cyJydDRql0PGCKRZ7wSsNyxGL+sJl+Hyq8apZ3+e7qNkXEZNux636deiwmQhu4caRP
	 yHp++Me/nGUWg==
Date: Mon, 10 Mar 2025 19:25:03 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>, Dumitru Ceclan
 <mitrutzceclan@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>, Matteo
 Martelli <matteomartelli3@gmail.com>, Alisa-Dariana Roman
 <alisadariana@gmail.com>, Ramona Alexandra Nechita
 <ramona.nechita@analog.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <20250310192503.71671275@jic23-huawei>
In-Reply-To: <4d5212b3-3801-408c-9a5d-c6111189793c@gmail.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
	<e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
	<CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
	<54a031d0-df47-4baa-a23a-1a79c0922542@gmail.com>
	<20250308162928.72bd1d1b@jic23-huawei>
	<4d5212b3-3801-408c-9a5d-c6111189793c@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_122521_838606_D467A282 
X-CRM114-Status: GOOD (  52.76  )
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

On Mon, 10 Mar 2025 09:41:00 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 08/03/2025 18:29, Jonathan Cameron wrote:
> > On Wed, 5 Mar 2025 12:54:33 +0200
> > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> >  =20
> >> Thanks for the review David.
> >>
> >> On 04/03/2025 11:25, David Lechner wrote: =20
> >>> On Mon, Mar 3, 2025 at 12:32=E2=80=AFPM Matti Vaittinen
> >>> <mazziesaccount@gmail.com> wrote: =20
> >>>>
> >>>> There are ADC ICs which may have some of the AIN pins usable for oth=
er
> >>>> functions. These ICs may have some of the AIN pins wired so that they
> >>>> should not be used for ADC.
> >>>>
> >>>> (Preferred?) way for marking pins which can be used as ADC inputs is=
 to
> >>>> add corresponding channels@N nodes in the device tree as described in
> >>>> the ADC binding yaml.
> >>>>
> >>>> Add couple of helper functions which can be used to retrieve the cha=
nnel
> >>>> information from the device node.
> >>>>
> >>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> >>>>
> >>>> --- =20
> >> =20
> >>>> + *
> >>>> + * Return:     Number of found channels on succes. Negative value t=
o indicate =20
> >>>
> >>> s/succes/success/ =20
> >>
> >> Thanks!
> >> =20
> >>>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
> >>>> +                                         const struct iio_chan_spec=
 *template,
> >>>> +                                         int max_chan_id,
> >>>> +                                         struct iio_chan_spec **cs)
> >>>> +{
> >>>> +       struct iio_chan_spec *chan_array, *chan;
> >>>> +       int num_chan =3D 0, ret;
> >>>> +
> >>>> +       num_chan =3D iio_adc_device_num_channels(dev);
> >>>> +       if (num_chan < 1)
> >>>> +               return num_chan;
> >>>> +
> >>>> +       chan_array =3D devm_kcalloc(dev, num_chan, sizeof(*chan_arra=
y),
> >>>> +                                 GFP_KERNEL);
> >>>> +       if (!chan_array)
> >>>> +               return -ENOMEM;
> >>>> +
> >>>> +       chan =3D &chan_array[0];
> >>>> +
> >>>> +       device_for_each_child_node_scoped(dev, child) {
> >>>> +               u32 ch;
> >>>> +
> >>>> +               if (!fwnode_name_eq(child, "channel"))
> >>>> +                       continue;
> >>>> +
> >>>> +               ret =3D fwnode_property_read_u32(child, "reg", &ch);
> >>>> +               if (ret)
> >>>> +                       return ret;
> >>>> +
> >>>> +               if (max_chan_id !=3D -1 && ch > max_chan_id)
> >>>> +                       return -ERANGE;
> >>>> + =20
> >>>
> >>> Should we use return dev_err_probe() on these to help with debugging =
a bad dtb?
> >>>     =20
> >>
> >> I am not fan of using dev_err_probe() in a 'library code'. This is
> >> because we never know if there'll be some odd use-case where this is n=
ot
> >> called from the probe.
> >>
> >> All in all, I'd leave adding most of the debugs to the callers -
> >> especially because we do not expect to have bad device-trees after the
> >> initial 'development stage' of a board. The board 'development stage'
> >> should really reveal bugs which prevent the channels from being
> >> registered - and after the DT is correct, these debug prints become
> >> unnecessary (albeit minor) binary bloat.
> >> =20
> >>>> +               *chan =3D *template;
> >>>> +               chan->channel =3D ch;
> >>>> +               chan++;
> >>>> +       }
> >>>> +
> >>>> +       *cs =3D chan_array;
> >>>> +
> >>>> +       return num_chan;
> >>>> +}
> >>>> +EXPORT_SYMBOL_NS_GPL(devm_iio_adc_device_alloc_chaninfo_se, "IIO_DR=
IVER"); =20
> >>>
> >>> We can make this less verbose by setting #define
> >>> DEFAULT_SYMBOL_NAMESPACE at the start of the file. Then we can just do
> >>> EXPORT_SYMBOL_GPL() throughout the rest of the file. =20
> >>
> >> I am not sure what to think of this. I use the good old 'ctrl + ]' in =
my
> >> editor when I need to check how a function was supposed to be used. Th=
at
> >> jumps to the spot of code where the function is. I'd like to see the
> >> namespace mentioned there in order to not accidentally miss the fact t=
he
> >> function belongs to one.
> >>
> >> OTOH, I do like simplifications. Yet, the added simplification might n=
ot
> >> warrant the namespace not being visible in the function definition.
> >> =20
> >>> Also, I would prefer if the namespace matched config name (IIO_ADC_HE=
LPER). =20
> >>
> >> I had some lengthy discussion about this with Andy and Jonathan during
> >> earlier review versions. In short, I don't like the idea of very
> >> fragmented namespaces in IIO, which will just complicate the drivers
> >> without providing any obvious benefit.
> >>
> >> https://lore.kernel.org/all/20250222174842.57c091c5@jic23-huawei/
> >> =20
> >>>> +
> >>>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
> >>>> +                                         const struct iio_chan_spec=
 *template,
> >>>> +                                         int max_chan_id,
> >>>> +                                         struct iio_chan_spec **cs);
> >>>> + =20
> >>>
> >>> There are some different opinions on this, but on the last patch I did
> >>> introducing a new namespace, the consensus seems to be that putting
> >>> the MODULE_IMPORT_NS() in the header file was convenient so that users
> >>> of the API don't have to remember to both include the header and add
> >>> the import macro.
> >>>     =20
> >>
> >> I do like this suggestion, and I believe this would be the balance
> >> between getting the benefit of hiding part of the symbols - while not
> >> unnecessarily complicating the callers. I know some people are opposing
> >> it though. My personal opinion is that having the MODULE_IMPORT_NS() in
> >> a header would be neatly simplifying the calling code with very little
> >> harm, especially here where including the header hardly has use-cases
> >> outside the IIO ADC.
> >>
> >> Unfortunately, the "safety" seems to often be a synonym for just "maki=
ng
> >> it intentionally hard". As Finnish people say: "K=C3=A4rsi, k=C3=A4rsi,
> >> kirkkaamman kruunun saat". :)
> >> (Roughly translated as "Suffer, suffer, you will get a brighter crown"=
).
> >>
> >> Let's hear what Jonathan thinks of your suggestion. =20
> >=20
> > For this particular case my intent was that all the IIO exports that
> > are suitable for use in simple IIO drives will be in this namespace,
> > we just haven't started that conversion yet.
> >=20
> > As such, having it defined from a header for this helper isn't a good
> > thing to do. =20
>=20
> Hmm. I agree.
>=20
> >  Generally I prefer to see in driver code what namespaces
> > are involved but do understand the other viewpoint. In this case I
> > definitely don't think it is appropriate unless we go for a specific na=
mespace
> > for just this helper. =20
>=20
> I suppose having the MODULE_IMPORT_NS() in the header would actually=20
> make the more fine-grained namespaces (like IIO_ADC_HELPERS, IIO_GTS,=20
> ...) much more usable. That'd relieved the drivers from explicitly=20
> listing multiple namespaces while nicely limiting the visibility.
>=20
> If IIO was my territory, I might want to ask people to go with that=20
> approach - but I am quite happy being a freeloade.. errm, I mean,=20
> bystander ;)
>=20
It relieves the burden but I'd still prefer explicit opt in to namespaces
unless there is general agreement on the approach of doing it in headers
which there has not been so far.

Jonathan

> Thanks!
>=20
> Yours,
> 	-- Matti


