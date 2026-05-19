Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8C8CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LTPYGtcx89rMEdlEx4RWufSMnylrrMRM/gftrPRK8o=; b=MMS5hyh8d71t2YCBHxArWNpYhl
	wo0OoAePkYI3PLKOXPBT7ItSUipdf5lWCT9E9hFt0e+APgzjKeJl9v1AhGPb9XGr44yUYPt6sBt7Z
	FMWEjrT2cafc5Poz61W9AlRr0ejIkz81Vvf9CKxSEQ8gcq+Q4F2T63fiDQUHQdfD93/GfuoLt9z1D
	F3dodN4UeBQQ86tpbvlOih4nehcB7cpyA/vbeJz2mc8rkWDW51b9S3yZEFwTRPFbnQBsIwEF/mF/J
	k5FNivNS1Kf2V/1FFbg50IzRaEh2rJkjzbSKgUsdcdTbieiReFmcxr7ZRd0gbkUfMCz0K42ZKH4y5
	5R74Rp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOGI-00000002OcX-3L05;
	Tue, 19 May 2026 17:29:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOGH-00000002Oax-1mE9;
	Tue, 19 May 2026 17:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+LTPYGtcx89rMEdlEx4RWufSMnylrrMRM/gftrPRK8o=; b=IJxUHZ1M6ok41NcLW0H29I9R3x
	3u/t7+X7+SAP79W85feDibT1Cc36X0qsf6dqiEsALtHAQt0+fPt14G5opdYAQeJYJ3axrEAY9T5Sv
	ZXUbBzxWa6613Zsgft2eFjNbyZ5PTtPys9eZhWvwTUXbrYvIZ3MqrnNx1XH/7lPfNSyLv6WzD+e1H
	f5x9oELh0mtDVKIt89vxHocBzAx1szkWXa6yva2W5cny473mn8fETnknQtDCQ1HM2QNRR2dpntQKp
	QjhylsZyrkKFLHoipjcblkg1a/OJSw9ypYSh6YzWtGsibp34TdrRAKl+wK997nNN/t08EouFM7NJf
	jttiPi+A==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOGC-0000000Ew0S-0pGg;
	Tue, 19 May 2026 17:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779211776;
	bh=KD0GOi9c8kuCzvfBSg/EAGaV+3IxmyoTnkrkk0bXqls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CcXO6GZ+H0Yjwf2NfeGPjK2m5QdX4F7pB/lCTm0hp16n1jzasLMSmzlO+ssQnG32w
	 tpwSW7KdB2mEhkFn2Wak83FFtLUHUNc466wT01RwJHY6cwswBPeFvsIifMmJUlAcKY
	 Y64WqyXLCsRUsr5lAo3EyKk944rP77AxapGYeIifjJPKxk1+ZvZPcfzyCXiFLoFkH2
	 XTYDNA4db8cMBjjXOIApizmud9+VBfWGzaOF5zDgprg+mNHh7swRWmtTVEtEsdNCkX
	 NhndFC23jyw/0vQR1Y1/Ol011CnTiq9KfWXFMtFQL7LQrsfpgbgt415c3VYvFI3QQq
	 SkHpyO2sfyIwg==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F14B17E125C;
	Tue, 19 May 2026 19:29:35 +0200 (CEST)
Date: Tue, 19 May 2026 19:29:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Marcin =?UTF-8?B?xZpsdXNhcno=?=
 <marcin.slusarz@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T.J. Mercier"
 <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260519192930.3873accb@fedora>
In-Reply-To: <CAPaKu7T7JZRmsS+D_3zFZtyhJk9mNXjL=xpAQ-UNGbm0vztyRg@mail.gmail.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260505181523.49a3d85c@fedora>
	<afxVIuVVPisBQ9p_@e129842.arm.com>
	<20260507135356.5428d50d@fedora>
	<agMvb_jeRsO7tSS-@e142607>
	<20260512161111.0cb7000e@fedora>
	<agNJasayW8VCHTiU@e142607>
	<CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
	<20260518091650.5a7a4f4a@fedora>
	<CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
	<20260519093955.448ff899@fedora>
	<8f0b1750-a853-4895-9672-73a75f6dbd84@arm.com>
	<CAPaKu7T7JZRmsS+D_3zFZtyhJk9mNXjL=xpAQ-UNGbm0vztyRg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_182940_588176_5E7B135B 
X-CRM114-Status: GOOD (  66.51  )
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

On Tue, 19 May 2026 10:07:02 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Tue, May 19, 2026 at 1:49=E2=80=AFAM Ketil Johnsen <ketil.johnsen@arm.=
com> wrote:
> >
> > On 19/05/2026 09:39, Boris Brezillon wrote: =20
> > > On Mon, 18 May 2026 17:36:40 -0700
> > > Chia-I Wu <olvaffe@gmail.com> wrote:
> > > =20
> > >> On Mon, May 18, 2026 at 12:16=E2=80=AFAM Boris Brezillon
> > >> <boris.brezillon@collabora.com> wrote: =20
> > >>>
> > >>> On Wed, 13 May 2026 12:31:32 -0700
> > >>> Chia-I Wu <olvaffe@gmail.com> wrote:
> > >>> =20
> > >>>> On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@a=
rm.com> wrote: =20
> > >>>>>
> > >>>>> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote: =
=20
> > >>>>>> On Tue, 12 May 2026 14:47:27 +0100
> > >>>>>> Liviu Dudau <liviu.dudau@arm.com> wrote:
> > >>>>>> =20
> > >>>>>>> On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote=
: =20
> > >>>>>>>> On Thu, 7 May 2026 11:02:26 +0200
> > >>>>>>>> Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > >>>>>>>> =20
> > >>>>>>>>> On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wro=
te: =20
> > >>>>>>>>>>> @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor=
_device *ptdev)
> > >>>>>>>>>>>                      return ret;
> > >>>>>>>>>>>      }
> > >>>>>>>>>>>
> > >>>>>>>>>>> +   /* If a protected heap name is specified but not found,=
 defer the probe until created */
> > >>>>>>>>>>> +   if (protected_heap_name && strlen(protected_heap_name))=
 { =20
> > >>>>>>>>>>
> > >>>>>>>>>> Do we really need this strlen() > 0? Won't dma_heap_find() f=
ail is the
> > >>>>>>>>>> name is "" already? =20
> > >>>>>>>>>
> > >>>>>>>>> If dma_heap_find() will fail, then the whole probe with fail =
too.
> > >>>>>>>>> This check prevents that. =20
> > >>>>>>>>
> > >>>>>>>> Yeah, that's also a questionable design choice. I mean, we can
> > >>>>>>>> currently probe and boot the FW even though we never setup the
> > >>>>>>>> protected FW sections, so why should we defer the probe here? =
Can't we
> > >>>>>>>> just retry the next time a group with the protected bit is cre=
ated and
> > >>>>>>>> fail if we can find a protected heap? =20
> > >>>>>>>
> > >>>>>>> The problem we have with the current firmware is that it does a=
 number of setup steps at "boot"
> > >>>>>>> time only. One of the steps is preparing its internal structure=
s for when it enters protected
> > >>>>>>> mode and it stores them in the buffer passed in at firmware loa=
ding. We cannot later run the
> > >>>>>>> process when we have a group with protected mode set. =20
> > >>>>>>
> > >>>>>> No, but we can force a full/slow reset and have that thing
> > >>>>>> re-initialized, can't we? I mean, that's basically what we do wh=
en a
> > >>>>>> fast reset fails: we re-initialize all the sections and reset ag=
ain, at
> > >>>>>> which point the FW should start from a fresh state, and be able =
to
> > >>>>>> properly initialize the protected-related stuff if protected sec=
tions
> > >>>>>> are populated. Am I missing something? =20
> > >>>>>
> > >>>>> Right, we can do that. For some reason I keep associating the res=
et with the
> > >>>>> error handling and not with "normal" operations. =20
> > >>>> I kind of hope we end up with either
> > >>>>
> > >>>>   - panthor knows the exact heap to use and fails with EPROBE_DEFE=
R if
> > >>>> the heap is missing, or
> > >>>>   - panthor gets a dma-buf from userspace and does the full reset
> > >>>>     - userspace also needs to provide a dma-buf for each protected
> > >>>> group for the suspend buffer
> > >>>>
> > >>>> than something in-between. The latter is more ad-hoc and basically
> > >>>> kicks the issue to the userspace. =20
> > >>>
> > >>> Indeed, the second option is more ad-hoc, but when you think about =
it,
> > >>> userspace has to have this knowledge, because it needs to know the
> > >>> dma-heap to use for buffer allocation that cross a device boundary
> > >>> anyway. Think about frames produced by a video decoder, and composi=
ted
> > >>> by the GPU into a protected scanout buffer that's passed to the KMS
> > >>> device. Why would the GPU driver be source of truth when it comes to
> > >>> choosing the heap to use to allocate protected buffers for the video
> > >>> decoder or those used for the display? =20
> > >> I don't think the GPU driver is ever the source of truth. If the
> > >> system integrator wants to specify the source of truth (SoT) from
> > >> kernel space, they should use the device tree (or module params /
> > >> config options). If they want to specify the SoT in userspace, then =
we
> > >> don't really care how it is done other than providing an ioctl.
> > >> Panthor is always on the receiving end. =20
> > >
> > > Okay, we're on the same page then.
> > > =20
> > >>
> > >> If we don't want to delay this functionality, but it takes time to
> > >> converge on SoT, maybe a solution that is not a long-term promise can
> > >> work? Of the options on the table (dt, module params, kconfig option=
s,
> > >> ioctls), a kconfig option, potentially marked as experimental, seems
> > >> like a good candidate. =20
> > >
> > > If Panthor is only a consumer, I actually think it'd be easier to just
> > > let userspace pass the protected FW section as an imported buffer
> > > through an ioctl for now. It means we don't need any of the
> > > modifications to the dma_heap API in this series, and userspace is fr=
ee
> > > to choose its SoT (efuse, DT, ...) and pass the info back to mesa/GBM
> > > somehow (envvar, driconf, ...). The only thing we need to ensure is if
> > > lazy protected FW section allocation is going to work, but given the
> > > current code purely and simply ignores those sections, and the FW is
> > > still able to boot and act properly (at least on v10-v13), I'm pretty
> > > confident this is okay, unless there's some trick the MCU can do to
> > > detect that the protected section isn't mapped (which I doubt, because
> > > the MCU doesn't know it lives behind an MMU). =20
> I set up MMU to map non-protected memory to the protected section the
> other day. The FW still booted fine. I didn't get access violation
> until the FW executed PROT_REGION and panthor requested
> GLB_PROTM_ENTER in response.

Ah, thanks for testing! We still don't have a setup with proper
protected heap, but that was on my list of things to test.

>=20
> This was on v13, but I also doubt it will become an issue. Can ARM help c=
larify?
>=20
> > >
> > > Of course, once we have a consensus on how to describe this in the DT,
> > > we can switch Panthor over to "protected dma_heap selection through D=
T",
> > > and reflect that through the ioctl that exposes whether protected
> > > support is ready or not (would be a DEV_QUERY), such that userspace c=
an
> > > skip this "PROTM initialization" step.
> > >
> > > We're talking about an extra ioctl to set those buffers, and a
> > > DEV_QUERY to query the state (ready or not), the size of the global
> > > protected buffer (protected FW section) and the size of the protected
> > > suspend buffer. The protected suspend buffer would be allocated and
> > > passed at group creation time (extra arg passed to the existing
> > > GROUP_CREATE ioctl). So, overall, I don't consider it a huge liability
> > > in term of maintenance cost. =20
> >
> > If we can avoid the dma-heap changes, then that would surely help!
> > I can try to implement this in the next version unless someone finds a
> > reason why it is a bad idea. =20
> Yeah, that sounds good to me too.
>=20
> Will the extra ioctl require root?

The PROTM_INIT ioctl will certainly require high privilege
CAP_SYS_<something>, dunno yet what that <something> would be though.

> On a system with true protected
> memory, the FW cannot write to non-protected memory. It seems ok to
> allow any client to make the ioctl call. But on systems without true
> protected memory, it can be problematic.

Yep, I agree we shouldn't let random users pretend they initialized
protected mode if the system as a whole doesn't have proper the proper
bit hooked up to set that up.

