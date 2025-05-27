Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEBEC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg9vGp1YHkXIBdUOEtw6pvaguTK4l9KgzQWa/jWZ448=; b=lDWA04wLtYxMW6hXwE0/T9kD/u
	NLWeDQ8Ahm8VSg7HjmRBxufbzLtk+ka2uesAbjeRvOXphwsFl0aMSbNz8qAtKtMqvWdSHzDcusUBP
	4Sc0kWGSIVWE9A/sJuJTPsbOqrNed8gC8Ca7dWoveGSxdg9uV1Om6WN+JhY2eWDjbdNyNH7giO2vk
	G4Q8HRcHPu4FhQ2sU1DnNovn48PcF5PQcII6lyY+yiuA/qUrAV09xOecf5R13bzvI1QOe7ivt6dnR
	NRtEnwMKz9xP3qSMa4RJ0KM6QEAb5kTTg/PWLhYUhsnE1z7bZPMJO0tqm7/0QhYwA9ZAGiDx5yUi4
	wQlQVLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqPS-0000000AMCX-1EtW;
	Tue, 27 May 2025 09:15:46 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqNC-0000000ALsb-1xl2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 09:13:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72BCA43289;
	Tue, 27 May 2025 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748337203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pg9vGp1YHkXIBdUOEtw6pvaguTK4l9KgzQWa/jWZ448=;
	b=Xb2vwIHVkxdOdtkzTqahMB8Ob0dPQkUA3ReoZGJM1L+qUX1Vj82fd4mZq3PzhNP32O1Jkx
	rxSGUArUiUNECAYK3qxLtiRJm5PaVkldh1ripu3EGGANBnyTGQYq5Z+wUniIQZpG3OSQyk
	fxy6iFkZ1zsno/GpVwOBAXOScSRK5Mgsp+pYsnop4MUJoH89/jvP3BX3j5OL2l62j7QPHZ
	TRfxyJo+oz1CBl0pusuylCCBt1fFB0hODm+XfsGwexCOGnNlrkkNuQndIhVhgWYEdQAkkB
	hu1CaDW+KPMGWdK7cB6wT/wJ4KKgUCIsA72wVLDaMj7d8mqzcV15qqamYMzVfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 11:13:21 +0200
Message-Id: <DA6TTA76AU5Z.32W0O8EORBCQC@bootlin.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "John
 Fastabend" <john.fastabend@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "KP Singh" <kpsingh@kernel.org>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon"
 <will@kernel.org>, "Mykola Lysenko" <mykolal@fb.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Florent Revest"
 <revest@chromium.org>
Cc: "Bastien Curutchet" <bastien.curutchet@bootlin.com>,
 <ebpf@linuxfoundation.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, "Xu Kuohai"
 <xukuohai@huawei.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf, arm64: Support up to 12 function
 arguments
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com>
 <20250522-many_args_arm64-v2-1-d6afdb9cf819@bootlin.com>
 <8d184497-fecf-497f-8b4c-bcd4b0a697ce@huaweicloud.com>
 <DA6T7OEF94IG.2BH2PWTCVEOTA@bootlin.com>
 <5535f49f-8903-4055-b99a-cf8b2d4666e1@huaweicloud.com>
In-Reply-To: <5535f49f-8903-4055-b99a-cf8b2d4666e1@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleelleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvvefuhffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefgfffhhefhfeegkefhffduhfehkeevffeluefhlefgfeeuveehvdekudfhheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmeguieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemugeihedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopeiguhhkuhhohhgriheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrf
 hgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_021326_982140_905A7A16 
X-CRM114-Status: UNSURE (   9.80  )
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

On Tue May 27, 2025 at 11:09 AM CEST, Xu Kuohai wrote:
> On 5/27/2025 4:45 PM, Alexis Lothor=C3=A9 wrote:
>
> [...]
>
>>>> +		/* We can not know for sure about exact alignment needs for
>>>> +		 * struct passed on stack, so deny those
>>>> +		 */
>>>> +		if (m->arg_flags[i] & BTF_FMODEL_STRUCT_ARG)
>>>> +			return -EOPNOTSUPP;
>>> leave the error code as is, namely, return -ENOTSUPP?
>> Actually this change follows a complaint from checkpatch:
>>=20
>> "WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"
>
> Seems we can just ignore this warning, as ENOTSUPP is already used
> throughout bpf, and the actual value -524 is well recognized.

Ok, then I'll switch it back to ENOTSUPP


--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


