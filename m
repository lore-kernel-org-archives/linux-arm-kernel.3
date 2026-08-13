Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963D3C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSbxuFNDxlXVpQ/cS578M2yFcGMkc7DG8pgNdZPizcw=; b=D1uJdAwTTBDnakVCbbkpFg3HHi
	HGFSFG1EZNgJYv4/w1el4qISCt/VBU53yg9cF7HYevsEF2Q6+GkuuPkG+j0Kcr3FAEeLpCUAibh/9
	oaOJcTVjDI2ziuudqDhBAT1acL1ANr6nQUufOIyVz2QEDCTH8f4bBGgUf0zJXVuOwjeORQl5AaoyQ
	E9wrL8ZVEx3yg5Xidbj39sDR4kOug+2gIPkQxYlnT2zQcTlTSIsPNUIySg/mq9uJVoJdJUfAXFlJG
	8yW7XywrrjzXaVdPljxCpEqTtJXozosxSqIh06YabKnpsEovwebOQQemgFrmSyxr9nw1DFPLrxXvG
	S0JovfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRbz-00000000H0h-35fb;
	Thu, 13 Aug 2026 09:20:31 +0000
Received: from ixit.cz ([2a02:830a:f787:8f00::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRbw-00000000Gz0-0nwx;
	Thu, 13 Aug 2026 09:20:30 +0000
Received: from smtpclient.apple (85-70-170-181.rcd.o2.cz [85.70.170.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id BC3165340217;
	Thu, 13 Aug 2026 11:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1786612821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSbxuFNDxlXVpQ/cS578M2yFcGMkc7DG8pgNdZPizcw=;
	b=LZXlAaqMDuz1Eu1qoATS2mQYnT7CsZwlU8A/IXlgD06ajK8b+e6H1n9LYw4UJuCZm5U/K1
	45EC+UwLTUEFW7hK5NTe7T8cn5/fV82S+8GeZjkxTS2flC4JayGWz1E96Y3dcIj8ur1J4R
	hWWn2JaZ0EhUTvH7hyEn/4YiTGlPbJw=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: David Heidelberg <david@ixit.cz>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 00/33] Add support for Qualcomm Snapdragon SM7150 SoC and Google Pixel 4a
Date: Thu, 13 Aug 2026 11:20:11 +0200
Message-Id: <7B026D92-3826-494D-B1A9-EF01D41B4461@ixit.cz>
References: <b15b2687-0c2e-43b2-ac9e-78e04e77e065@mainlining.org>
Cc: Jens Reidel <adrian@mainlining.org>,
 Danila Tikhonov <danila@jiaxyga.com>, Miro Mraz <mraz.miro@seznam.cz>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 neil.armstrong@linaro.org, linux-hardening@vger.kernel.org,
 linux@mainlining.org, Connor Mitchell <c.dog29@hotmail.com>
In-Reply-To: <b15b2687-0c2e-43b2-ac9e-78e04e77e065@mainlining.org>
To: Danila Tikhonov <danila@mainlining.org>
X-Mailer: iPhone Mail (23G71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022028_512995_FB91B491 
X-CRM114-Status: GOOD (  18.69  )
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


> On 12. 8. 2026, at 22:54, Danila Tikhonov <danila@mainlining.org> wrote:
>=20
> =EF=BB=BFHi David,
>=20
> Thank you for your comment.
>=20
>> On 12/08/2026 14:40, David Heidelberg wrote:
>>=20
>>=20
>>> On 23/04/2025 09:26, Neil Armstrong wrote:
>>> Hi,
>>>=20
>>> On 23/04/2025 00:07, Jens Reidel wrote:
>>>> Hi everyone,
>>>>=20
>>>> apologies for the mess this created. Danila's mail provider ratelimited=
 him halfway through sending the series and the attempt to re-try sending th=
e second half an hour later ended up with a new message ID (I think due to n=
ot using --in-reply-to).
>>>> He asked me to let you know that this will be resolved later and the wh=
ole series will be re-sent once the problems are resolved.
>>>=20
>>> The b4 web submission is a great alternative when the mail provider is r=
ate limited:
>>> https://b4.docs.kernel.org/en/latest/contributor/send.html#web-endpoint
>>>=20
>>=20
>> I see people interested in moving Pixel 4a forward, but it seems this was=
 never upstreamed? I looked at sm7150 repository [1] where I see FROMLIST, b=
ut these patches never arrived to the list and this series is from 2025.
>>=20
>> Should we expect v2 (re)based on recent tree?
>>=20
>=20
> I'd definitely like to get back to upstreaming SM7150 and the devices
> based on it, but I don't think there's much value in continuing with
> this particular series as-is. A lot has changed in the kernel over the
> past year, which would require substantial changes throughout the series
> and would effectively force the maintainers to review it from scratch
> anyway.

After longer period of time maintainers will have to do full review anyway. S=
ure, the reviews needs to be addressed :)

>=20
> I'd also like to split the series up to avoid targeting such a large
> number of maintainers in a single submission.

Yes, that=E2=80=99s exactly what=E2=80=99s needed (at least for the part pat=
ches I saw).

> Hopefully, I'll be able to
> find some time to work on this in the near future.

Where the most recent patchset can be found? Just in case someone wanted to p=
ush some bits in meantime.

Thanks
David

>=20
>=20
>> Thanks
>> David
>>=20
>> [1] https://github.com/sm7150-mainline/linux/commit/7ea41523c678e94a7c048=
936052b5b1b1b109cdd
>>=20
>>> Neil
>>>=20
>>>>=20
>>>> Best regards,
>>>> Jens
>>>=20
>>>=20
> ---
> Best regards,
> Danila

