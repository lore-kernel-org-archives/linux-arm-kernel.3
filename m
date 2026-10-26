Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B24606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HHotYutt;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pmG/wFh6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/WbmzAiyWcvHmSv7E29sRLAnuB0OvRYI/9hL4j09sAY=; b=HHotYutt25o0Qu
	DHeEfwhsIReLPy57Mys4gH0rAt5uQmsScuooEBnkXSMWZhDEu1yzewui9zk2W/Avzab025ECfPCXh
	Z3pPwVModG/t8rHy38UgfbRNCf2g+CClk1aTiPcqGiGKcasTeG4Ytry3gzE2ryj9kEQnXc6aHzUSo
	U2e1JYGvi4rZiCLFgA0jczSIsPjItoC4sWmCi9rD1GTOCNcjYHaCLBOxka9rpoSKz0cRIQOk8NrJB
	YbLfW2bf8d4PIpiOjtSoIIJC8D40YD61nXtbNu9ru8puK5+U2O5yaDHh22y78WGdORhy8RVaimIp6
	/lAdo+/lt8cAgYJK7nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHFh-000000026cH-3b4n;
	Mon, 26 Oct 2026 09:44:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHFe-000000026bS-1Wfl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:44:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2514209f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793007860; x=1793612660; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WbmzAiyWcvHmSv7E29sRLAnuB0OvRYI/9hL4j09sAY=;
        b=pmG/wFh6NDUGtBzE8sG4QVkbtaNOAvyW3BV9wTeYV/Y1gzxZ/MdknZcu8hOs5KsyLT
         994FnTrbi82BLHso7spahs45SyHl4u1TB3Zvy0rq2CZWV3p7TpkUUOCPRmsn9ZEFAGgA
         IjIxYu2Yk929y5sjQ9DOyFZcrtqXBkYRnlq76A2TobbTx8ufHyW0HiG/uCnYG5wtgcyQ
         iMDxOOJWkcZkXlIQ1kfa08NceKVEBXOPXYOlHjjf31IEWGq5omJ5UE2dYtTj3JiRFK3h
         Nc6tUp24SAxFHTAa7qDVUiNvGKEf3QBB+lPrzLizBbm052qA+Gly5MuTClop6WhfseVF
         Uw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007860; x=1793612660;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WbmzAiyWcvHmSv7E29sRLAnuB0OvRYI/9hL4j09sAY=;
        b=MBKClWkzVyXiciX5GwBBT7GPobDtMRC3D8JxSvTNApghUUgtU0LRlek7eorDTSsUAn
         1CjbX02T1uL4xKOj5ZAc+QRDstGWrvWmVcetqS5tFa1kWY8wMfKlivChSJfeZX2dm3OU
         FM/mRiI+DbOYtsUvybMOp82MqLPMcxOK7Rsd7trqfbleL63KQjb7amlBa/GkulhGiBBE
         V8UcTXXGKV3LrA7+ALkHVvbVBJ7mQn5LBl8qEe1M1sMMzwFh6kP+MoJy7woYmcku5pkU
         MrInZrKUXeqBhAYRC2RXPNXj/VZpCAx72iRLCsFL67HzIMzMGasu2Q7iFz//DlcEw9uS
         0m2A==
X-Forwarded-Encrypted: i=1; AKwUvBzz4WhqIetJO/gogm0XAs8ETdizdsjDqH0Gn2ESAwaP+57olNJV0YplmhY8T+V4sdfW78KqObGNBEaV8KHcxRZ7@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2POKp++Tu9iOYiEbwnpXulJJ8qCGD8u1fqoREQbbBTLClCLpf
	q49WYZrES5xUO6anw1+YBvWTti1Kwfp/tZbncgVe7EeHGAtdsQG9gUqDfL8oTAAMxIA=
X-Gm-Gg: AYBFou2SS2aTAX0VyrlxhBhMnvEA68p0txhE5PTPfzz98r+/gRyZKIXLnyKjZfYyF+Q
	kHFNxtn+HCb5j3f/TcnLkY5VjmsvICXKf2cMo1+FwfXY0YKOdQPRsYDzBupV+F6ko56YRrsJ1AK
	WE4zWeRGJBOAqeGlltwBl5nHBnjaQoOb5Kp3tqC88zRLBx52F13+K5atcHV9fZsDXTTOHMF9w7h
	Gi8lp1EepfdEFDeDXtyYzN2kDb7J+CSJGPdP58xqmAJ8AGZKyBOjj1dvK5ZfxJuWHzIl8kS0HdR
	NpH9zAmSifJbGAFdxP0eLThvH2dIyuCdV4ae3ETF0xQu59p2YyeytiRVeyJi5SX/u5+AsEo4ONP
	R5MWb8L6Oa+eXL58ztmbTYXexqPc2CdN17sYGdUkuD+k5yjRYEkH/JlLLiTdFaFbS+QANa0lFnY
	kvnNOz43lXPuggFLpNNgs69sppTxKG/O6unTUlSEVwSoDx5VVfNN8IDvL89bAjGCwUzQY6S3z8o
	Q9xLg9XoXUVtOSPHgglWAu3X74ng1wOqrnW99Tvhe5EMVoJNXrkCrxQypmpZv/1eaXFIip8oZY=
X-Received: by 2002:a05:6000:25fc:b0:48a:fb1c:c2a1 with SMTP id ffacd0b85a97d-48e3eb946b0mr10651921f8f.47.1793007860100;
        Mon, 26 Oct 2026 02:44:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm15669310f8f.52.2026.10.26.02.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:44:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, Abel
 Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@gehealthcare.com>,
 =?utf-8?Q?Herv=C3=A9?=
 Codina <herve.codina@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
In-Reply-To: <87h5icnzs9.fsf@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
 <atjIIHkoNwBVDO5b@redhat.com>
 <1jtsmch5id.fsf@starbuckisacylon.baylibre.com>
 <87h5icnzs9.fsf@bootlin.com>
Date: Mon, 26 Oct 2026 10:44:18 +0100
Message-ID: <1j8q3kkd8t.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_024422_569340_397018A6 
X-CRM114-Status: GOOD (  71.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On ven. 23 oct. 2026 at 18:32, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:

> Hello,
>
> On 23/10/2026 at 16:10:34 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> On mer. 21 oct. 2026 at 10:11, Brian Masney <bmasney@redhat.com> wrote:
>>
>>> Hi Miquel (and Jerome),
>>>
>>> On Wed, Oct 21, 2026 at 03:09:56PM +0200, Miquel Raynal wrote:
>>>> Hello,
>>>>=20
>>>> Thanks to Brian's series, we can finally solve the problem of rate
>>>> calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
>>>> series using a v7.1 mainline kernel with a lot of unrelated DRM
>>>> patches. I then re-applied it on top of clk-next after fixing the few
>>>> conflicts when applying Brian's series, but that means I cannot (yet)
>>>> run a 7.2/7.3 kernel on the platform (and applying this series with b4
>>>> will fail due to Brian's series no longer applying on top of clk-next).
>>>>=20
>>>> The DTS patch is there for reference, I don't mind if it's not picked
>>>> up.
>>>>=20
>>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>
>>> Thanks for testing and posting this!
>>>
>>> I know that Jerome would like to see some changes to my rate change
>>> series before it can be merged. I'm going to probably poorly describe
>>> his concerns here, so apologies in advance if I miscommunicate this
>>> Jerome. I'd appreciate it if you could clarify.
>>>
>>> - Currently the latest version posted (v8) to the list has the LCM
>>>   helper (clk_hw_get_children_lcm) in drivers/clk/clk.c, and the LCM
>>>   helper should be in clk-divider.c. I agree that it should be in the
>>>   divider code, but we'd have to export some additional APIs to allow
>>>   that. In the future if we went with what's in v8, and wanted to fix
>>>   the fractional dividers, then it would need a similar type of helper
>>>   in clk.c, which is not ideal. I initially went with this approach to
>>>   limit the APIs that are exported from the clk core.
>>>
>>> - I have a draft v9 series that I haven't posted yet that adds two new
>>>   helpers: clk_hw_get_num_children() and clk_hw_get_child_by_index()
>>>   similar to the existing functions for the parents. This allows moving
>>>   the LCM logic into clk-divider.c where it belongs, however the
>>>   downside to this approach is that it expands the clk exported APIs so
>>>   that providers will be able to fully walk the clk tree. The concern is
>>>   that providers may abuse this in the future and it may limit future
>>>   changes / cleanups to the clk core. For example, if we wanted to clean
>>>   up the way locking is done, this may potentially limit the available
>>>   options.
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=
=3Dclk-divider-scaling-v9
>>>
>>> - He would like to see it where each clk consumer sets the min/max rate
>>>   that's acceptable, and the clk scaling in the provider takes those
>>>   ranges into account when rates are negotiated.
>>>
>>> Anyways, please chime in Jerome if I got this right / wrong, and any
>>> additional concerns.
>>>
>>
>> Hi Brian, Miquel,
>>
>> Thanks Brian for the summary, and Miquel for testing and posting this.
>> The i.MX8MP LDB/pixel case is a real problem and I'd like us to solve
>> it. My concerns are about how, more than whether.
>>
>> You got most of it. The main nuance is I want to convey is where it
>> should live IMO: not in a divider helper, and not in providers at all,
>> but in the core. I'll try to explain.
>>
>> So far, CCF has preserved the settings of each element, or more
>> honestly, left them alone: if a divider divides by 4, it keeps doing so
>> whatever happens to its parent. This behavior has been there for years
>> and many devices rely on it, even if unknowingly. Miquel, I understand
>> you would rather make the new behavior the default, but I think this one
>> is here to stay. That said, it would be nice to have a way to say that
>> the rate should be preserved rather than the setting. I'll come back
>> to that.
>>
>> My first concern is about the responsibilities of each component. IMO a
>> provider should only describe the transfer function it implements:
>> "given this parent rate, here is what I can do". It should not walk
>> the tree or care about what its children are doing. Coordinating the
>> providers is the core's job, without assumptions about their transfer
>> functions.
>>
>> Providers already query their parents: a mux asks each candidate
>> parent what it can provide, and a clock with CLK_SET_RATE_PARENT
>> forwards its request upward. That is the request path, and the core
>> stays in charge of it. Reading the state of children or siblings, and
>> deciding on their behalf, is a different thing. Once a provider is
>> allowed to do that, there is no good reason to deny it to the others,
>> and I think that would make the core much harder to maintain. It could
>> also get in the way of other pressing work, like the global lock problem,
>> where tree walking will certainly play a critical role. Miquel's
>> patch 2 is a good illustration: the helper ends up comparing the
>> clk_hw of the tree with the inner clk_hw of a composite, which is not
>> part of the tree.
>>
>> My second concern is that it is tied to the integer divider, since it
>> relies on the LCM. If another element with a different transfer
>> function sits on the path, it does not work, as we discussed. We could
>> extend the principle to other types, but:
>> * I don't see how the different types would reconcile, since each one
>>   does its own thing in its own .determine_rate();
>> * the change is no longer simple and harmless if it has to spread to
>>   every provider to work.
>>
>> The behavior is also hard for consumers to predict. For example, the
>> parent rate is only negotiated with the subtree of the divider's
>> direct parent. With a gate between the divider and the PLL, the other
>> branches of the PLL are left out. That could be fixed with more tree
>> walking in the provider, which brings us back to my first point.
>>
>> If such a mechanism is needed, I would much prefer it done entirely in
>> the core, in a generic way, with no assumption about the transfer
>> functions involved. I realize this may go against a direction
>> suggested at a previous LPC, which this series followed, and I think the
>> points above are worth reconsidering it for.
>>
>> I say "if" because I doubt clock trees are designed with runtime rate
>> negotiation in mind. So far, we have mostly dealt with these cases by
>> removing CLK_SET_RATE_PARENT and using assigned-clock-rates on the
>> shared ancestor. I understand that falls short when the PLL has to
>> follow the display mode, as here.
>>
>> For rate negotiation, my suggestion would be to reuse what the
>> framework already has: clock ranges, and re-running .determine_rate()
>> on the children being dragged along, with the common ancestor's rate
>> pinned. When that rate does not suit a sibling's range, other ancestor
>> rates can be tried within the constraints, rather than giving up.
>>
>> clk_set_rate() is a best effort function. It tries to get as close to
>> the request as possible, honoring the ranges of every clock along the
>> path, and it is up to the consumer to decide whether the result is
>> good enough. That decision is lost if the framework recomputes the
>> rates of a sibling branch on its own. Ranges could help it decide:
>> either "I'm fine with the new rate", or -EBUSY.
>
> I see an upside with this approach: we could keep one single rate
> negotiation logic. But it still requires modifications to be done on a
> per user basis to be enabled (but that is needed from your perspective).
>
> While I fully understand all the concerns expressed above, there has
> been one minor point that arose while working on your series: it's
> very hard to determine the tolerance beyond which the clock rate shall
> be refused. Expect bikeshedding on a per driver basis.

This is my point exactly. Each consumer is going to need to do its own
thing and it is why I would prefer if the decision was not a core or
a provider thing.

A decision must be made somewhere. I don't really see where else it
could be made than with the consumer. It is the only one which has
any idea what it is trying acheive.

If the range is about HW capability (from the clock side I mean),
a range can be set from the provider. Some already do that and I
think it is fine for that purpose. In the experiment I've provided,
I did not enable the propagation logic in that case, on purpose.
It could constrain the clock tree for clock that are actually
unused. It still participate in the decision logic if a consumer
enable it however.

>
>> What I'm suggesting is to treat any clock with a range as one that
>> needs updating. Its consumer cared enough to tell us what it can and
>> cannot cope with. That removes the need for a specific flag, and puts
>> the rate policy in the consumer, which is where I'd prefer use case
>> choices to live, rather than in the provider or the core. It would
>> also fix clocks being dragged out of their range during an update.
>> Presumably, a clock without a range does not care enough to give us a
>> decider, so the framework has no basis to act on its behalf and keeps
>> today's behavior. I think this behavior will keep on being good enough
>> for the vast majority clocks out there and it is a lot lighter
>> on the math side (which is already quite severe as it is)
>
> Well, yeah, I see we share conclusions :-)
>
>> I've been checking whether the idea is remotely feasible. It involves
>> multiple planning stages and multiple tops. It is still very rough,
>> but there is the beginning of something:
>>
>> https://github.com/jbrun3t/linux/commits/clk/clk-rate-range-update/
>>
>> Miquel, if you fancy trying it, please let me know whether it works
>> for you. All you should need is to set a range on the clocks you care
>> about.
>
> I managed to pull most of the clock patches in your branch and apply
> them to my 7.2 branch (with a couple of tweaks). I then made the changes
> to request a tolerance as you hinted (available below) in the two
> relevant drivers: it worked as expected!
>
> While doing so, I realized the whole operation (set rate, set rate
> range, get rate and verify) needs to be repeated almost identically in
> every user of the "tolerance composition" logic, which probably
> indicates that a core helper would be relevant instead. I had in mind
> something like ~clk_set_rate_and_tolerance() which would do the
> equivalent of my fsl_ldb_link_rate_set() and lcdif_pixel_rate_set()
> helpers.

Indeed, I suppose an helper could be introduced for that if we don't
already have one. It does not even depend on the experiment presented
here. As long as there is a user for it, it would be fine IMO.

Maybe something that takes a rate and a ratio, like the duty cycle API ?

>
>> Sorry for this rather long explanation.
>>
>> Brian, your series is what got this discussion going, I know a lot of
>> efforts have gone into it already. I'd be glad to work on this together.
>
> In case that is relevant, here is below the code snippet which I used to
> get my panels working after removing the assigned rates from the DTS on
> i.MX8MP.
>
> Thanks,
> Miqu=C3=A8l
>
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index 1d65c75845a4..db17b26b7f3f 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -16,6 +16,13 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_of.h>
>=20=20
> +#define FSL_LDB_CLK_TOLERANCE_PERCENT  1
> +
>  #define LDB_CTRL_CH0_ENABLE                    BIT(0)
>  #define LDB_CTRL_CH0_DI_SELECT                 BIT(1)
>  #define LDB_CTRL_CH1_ENABLE                    BIT(2)
> @@ -111,6 +118,44 @@ static unsigned long fsl_ldb_link_frequency(struct f=
sl_ldb *fsl_ldb, int clock)
>                 return clock * 7000;
>  }
>=20=20
> +static int fsl_ldb_link_rate_set(struct fsl_ldb *fsl_ldb,
> +                                const struct drm_display_mode *mode)
> +{
> +       unsigned long requested_link_freq, min_link_freq, max_link_freq;
> +       unsigned long configured_link_freq;
> +       int ret;
> +
> +       requested_link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->clo=
ck);
> +       min_link_freq =3D requested_link_freq -
> +                       requested_link_freq * FSL_LDB_CLK_TOLERANCE_PERCE=
NT / 100;
> +       max_link_freq =3D requested_link_freq +
> +                       requested_link_freq * FSL_LDB_CLK_TOLERANCE_PERCE=
NT / 100;
> +
> +       ret =3D clk_set_rate(fsl_ldb->clk, requested_link_freq);
> +       if (ret) {
> +               dev_err(fsl_ldb->dev, "Failed to set %pC to %lu Hz: %d\n",
> +                       fsl_ldb->clk, requested_link_freq, ret);
> +               return ret;
> +       }
> +
> +       ret =3D clk_set_rate_range(fsl_ldb->clk, min_link_freq, max_link_=
freq);
> +       if (ret) {
> +               dev_err(fsl_ldb->dev,
> +                       "Failed to keep %pC in [%lu, %lu] Hz: %d\n",
> +                       fsl_ldb->clk, min_link_freq, max_link_freq, ret);
> +               return ret;
> +       }
> +
> +       configured_link_freq =3D clk_get_rate(fsl_ldb->clk);
> +       if (configured_link_freq < min_link_freq ||
> +           configured_link_freq > max_link_freq)
> +               dev_warn(fsl_ldb->dev,
> +                        "Configured %pC clock (%lu Hz) does not match re=
quested LVDS clock: %lu Hz\n",
> +                        fsl_ldb->clk, configured_link_freq, requested_li=
nk_freq);
> +
> +       return 0;
> +}
> +
>  static int fsl_ldb_attach(struct drm_bridge *bridge,
>                           struct drm_encoder *encoder,
>                           enum drm_bridge_attach_flags flags)
> @@ -130,11 +175,10 @@ static void fsl_ldb_atomic_enable(struct drm_bridge=
 *bridge,
>         const struct drm_display_mode *mode;
>         struct drm_connector *connector;
>         struct drm_crtc *crtc;
> -       unsigned long configured_link_freq;
> -       unsigned long requested_link_freq;
>         bool lvds_format_24bpp;
>         bool lvds_format_jeida;
>         u32 reg;
> +       int ret;
>=20=20
>         /* Get the LVDS format from the bridge state. */
>         bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> @@ -175,14 +219,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge =
*bridge,
>         crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
>         mode =3D &crtc_state->adjusted_mode;
>=20=20
> -       requested_link_freq =3D fsl_ldb_link_frequency(fsl_ldb, mode->clo=
ck);
> -       clk_set_rate(fsl_ldb->clk, requested_link_freq);
> -
> -       configured_link_freq =3D clk_get_rate(fsl_ldb->clk);
> -       if (configured_link_freq !=3D requested_link_freq)
> -               dev_warn(fsl_ldb->dev,
> -                        "Configured %pC clock (%lu Hz) does not match re=
quested LVDS clock: %lu Hz\n",
> -                        fsl_ldb->clk, configured_link_freq, requested_li=
nk_freq);
> +       ret =3D fsl_ldb_link_rate_set(fsl_ldb, mode);
> +       if (ret)
> +               return;
>=20=20
>         clk_prepare_enable(fsl_ldb->clk);
>=20=20
> @@ -241,6 +280,8 @@ static void fsl_ldb_atomic_disable(struct drm_bridge =
*bridge,
>         regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
>=20=20
>         clk_disable_unprepare(fsl_ldb->clk);
> +
> +       clk_drop_range(fsl_ldb->clk);
>  }
>=20=20
>  #define MAX_INPUT_SEL_FORMATS 1
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index ade76c3f4e4e..2dddb82e0269 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -32,6 +32,13 @@
>  #include "lcdif_drv.h"
>  #include "lcdif_regs.h"
>=20=20
> +#define LCDIF_PIXEL_CLK_TOLERANCE_PERCENT      1
> +
>  struct lcdif_crtc_state {
>         struct drm_crtc_state   base;   /* always be the first member */
>         u32                     bus_format;
> @@ -527,6 +534,38 @@ static void lcdif_crtc_atomic_flush(struct drm_crtc =
*crtc,
>         spin_unlock_irq(&crtc->dev->event_lock);
>  }
>=20=20
> +static int lcdif_pixel_rate_set(struct lcdif_drm_private *lcdif,
> +                               const struct drm_display_mode *m)
> +{
> +       unsigned long pix_rate =3D m->clock * 1000;
> +       unsigned long min_rate, max_rate;
> +       int ret;
> +
> +       /*
> +        * Pin the pixel rate so a change on the PLL made for another bra=
nch
> +        * (typically the LDB serializer clock) does not drag it away.
> +        */
> +       min_rate =3D pix_rate - pix_rate * LCDIF_PIXEL_CLK_TOLERANCE_PERC=
ENT / 100;
> +       max_rate =3D pix_rate + pix_rate * LCDIF_PIXEL_CLK_TOLERANCE_PERC=
ENT / 100;
> +
> +       ret =3D clk_set_rate(lcdif->clk, pix_rate);
> +       if (ret) {
> +               drm_err(lcdif->drm, "Failed to set pixel clock to %lu Hz:=
 %d\n",
> +                       pix_rate, ret);
> +               return ret;
> +       }
> +
> +       ret =3D clk_set_rate_range(lcdif->clk, min_rate, max_rate);
> +       if (ret) {
> +               drm_err(lcdif->drm,
> +                       "Failed to keep pixel clock in [%lu, %lu] Hz: %d\=
n",
> +                       min_rate, max_rate, ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
>                                      struct drm_atomic_commit *state)
>  {
> @@ -537,8 +576,11 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc=
 *crtc,
>         struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
>         struct drm_device *drm =3D lcdif->drm;
>         dma_addr_t paddr;
> +       int ret;
>=20=20
> -       clk_set_rate(lcdif->clk, m->clock * 1000);
> +       ret =3D lcdif_pixel_rate_set(lcdif, m);
> +       if (ret)
> +               return;
>=20=20
>         pm_runtime_get_sync(drm->dev);
>=20=20
> @@ -568,6 +610,8 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc=
 *crtc,
>=20=20
>         lcdif_disable_controller(lcdif);
>=20=20
> +       clk_drop_range(lcdif->clk);
> +
>         spin_lock_irq(&drm->event_lock);
>         event =3D crtc->state->event;
>         if (event) {

--=20
Jerome

