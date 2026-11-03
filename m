Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB7B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rcOq7a+t;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=YmV6RvIl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dc7YS7E4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OG7G7PorkiRlIdo4/3T/y2XzMFds8zQXDfkhHN9H58Q=; b=rcOq7a+tlBgFMaTKnlSjYe4cg7
	emAFWSD47jS4FQfWrSv7BPnT2hV8EkGfXWqYKHZbYui21BXkCvckcH0lJeLwGVGxlVT3pUFjw5NUi
	AOINwaJLadlj/bXk1RUgGzJ6ZcjBH8RFLnMN31WpAqcBe+a8C/4cIG/zcLY4QdIsH0ECO6FFZMBsy
	GvdOvcTbqLlptFHbviDQ79hdA98OyAv2gq+IyJeBKcvzBvxOeWT+cgZwKO3jZ2qGLPKpvpzaN5VzT
	AmEKBqF+Qv8OVT8NN9WljM0Qjl2YBMReZjcyK3Rh4AXRZFzTxts4cu7eh8OP5AsCnSzNs9KxXhGhx
	2NjUP3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB8f-00000001obI-28zc;
	Tue, 03 Nov 2026 09:49:09 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB8d-00000001oZg-2BL1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:49:08 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 539D47A016E
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 04:49:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 03 Nov 2026 04:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793699345;
	 x=1793785745; bh=OG7G7PorkiRlIdo4/3T/y2XzMFds8zQXDfkhHN9H58Q=; b=
	YmV6RvIlPYeodh59rkbGI5zqJRCYlOa7gMl0n9WZXPGF8bld9Ui+8PNS+fXrtvhf
	3Q04AU4OPyuOwAmuEPkTEeLZ/4EkGevbsf+juEFiXbTfZLRHbc5EnQTtifVM8rLH
	PXbjhCTZRwLQSvHHZ3ROuyL5J3xkDimv9Xwp2hDzM/onfotvSBcEc+Bq7q0ccPCy
	TcclLdfayPIs44bZ1TfJjkmVPNQEDcpCZCvCrz8wi//XOu5ZejDmSlwqVy6cO5Nr
	RmHyXV3ZJGD6cCepWl/yJ1EswFnOVJiNlQRUht3iguxqNkU4BUZVs1juDE6+M4QK
	3EadjNls3DjUScjCYNHIew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793699345; x=
	1793785745; bh=OG7G7PorkiRlIdo4/3T/y2XzMFds8zQXDfkhHN9H58Q=; b=d
	c7YS7E4H+TBEtgldCTpv22V9t48KUldRdHrTmscixOKvYNUaCigHs3KZ2Uq01e1/
	XnstUaFPFQKZw81hLvXK37HOBN85EkI86PhPvlhQ15KMO0xbyptPwPs/gybdEDG1
	kKnhgXVL2eGXWvzq8VO58DzlHJ0d/vWL7Yt9rKYH9r4QXTh900bgI6SHdMauGwXZ
	IgLc4QjS2MOPtNiDjwgdEB8EWAwGLglAuRoqUbn2NNmxoYImSL7svsA0Jip0QgYG
	dkCyFcEeu4efLY/DyH3g3ZXJopEyE+5uBBiLFty0wMmaKIeU9g6UOPRUP7GzTUSE
	l8v4cNafxyG1rqQoS+j9Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793699345; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:Y9/mnH1KhMFn/UR0oZyRast0xHftbxm+2SBSvrfYIdQ0Ipt
	dprhYNqIcuQdV1caJZiBvLYRcsVnb1zja+0MvOX2OXJLcxhg52STqFRiS6vXn7+r
	xdJG8TEgsjXIoFGFeQiJ2hqzzIqNDlcMa0fofyjEAI3ATV3JKe/oFne4sHGbHvJx
	eAV1cKebOzdQ9DGUlWgDt8WgJ1fCYURBCm9P6i2M9Tce4Uaa6nLqX2hjhsGrx3WQ
	vkhOQLsiB6yWwMx2pyXZ5K4RukvlHM2DxE6UyvKHeAdxBwb/4aWjN1ymnT40ZarH
	tunCzxrXbuNdJ4qhCHOnokfOecnfflJ4WxZ3+gQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:KFEYeJSeqaQvdhSfOiFj3pESt9ROi+/kLsY54sLVMnQ=:A69AET1Hnmc2CppcAFFTir5bItDWu7qWG+xCGZtT8N8=;
X-ME-Sender: <xms:EK7panJYqIeXKlzyb6RoVeAgS3geUr915EtAV6OD-2UYHkbvHh_uxQ>
    <xme:EK7pagKyYa1o55Q3frqsugecORLznxWZCW4-92hD4s0OqcBTONOdR3fHC0EKwgzGu
    q8VP1wTjlcv6F8hSu2ySvIv_7WzsTUCu_EfUZpXUip0r1VeXDMw1mGa>
X-ME-Received: <xmr:EK7pagley4nv7EFzEUeN3saxq8aXmmzmPxNYSJbz1OZ9wPHV3VJXkMksh8zvrXxt-DcHawFTE5u75CxYQoEOTWUA>
X-ME-Proxy-Cause: dmFkZTGoAdnMZpSzRxjqGakBDdmQBjBOFDndVX07QMFZZzrUmDy5sPPmTzyIX+5y2ejCSm
    k29jl5O6VozixDzDldi3Dxucr92wBgwkB7AFKK+oJRd1vvaGeznaUxq/Ge83a4h0bDAIID
    LUXb3jKBN+Dyids7eIDdNJ69zI3GAppKgn2TPI+407ytDKj+HrZ6k7r3kqSIkVD7ZSeT/X
    4TRTGrSmr5eXXMnSSE6VCvLeaJSQu9hXBTna8wz8ToUeLLIxgGKeJ5go0kqwiibYNlqYpu
    womEK5z3VLYxCyk3zpnVdd1on5EzmFysqm7Uq0a2dQZjDhSoYG9+wjubq8XEj6WoKrvFGv
    Cp9M/YhHv//3rjPbK/K+DMm5MRq8aLjx+9xCSZuhzKjFWhsuPOscy4By1Uu06h/cpDYHAd
    fbWc4buaUhPxaWVYqi/VZ4XEKEOVj+WxKVsfjKdLPYWTAMQlK7PtCY2+YNcFZp66k7ulJy
    0LAt9U1k9w73KjUQvgoVRzyBouELenbH0/sTcp8SQD6XB8NZ9dPX6isKJ/3OtZgMyxB1BS
    EQUxpo+pk+ceBmBolZBLZTTC2p5B/SFrudk15CTxcMQLTljaA3Mr/H+lq8Ed4b4E77cnwU
    8sZ6nWtYMVptckoZ9Vz10p2LepBv8U0/K81szq1wR3FmJP0neGYTxuWSIVLg
X-ME-Proxy: <xmx:EK7pamJjHbUZv5oF3g4dFGL0JiI6jyTvKj9DYg7SPHHJGC4BmmVTSg>
    <xmx:EK7parWzXTUrbuO0iPy1sCGhUEJni6dZNS9khgzOBwxGpcTEMfkX0g>
    <xmx:EK7parOa7YBXhVg7ITjmD0t_zI_z2kBY-ztTWrpAatQCYTt-kEfLmw>
    <xmx:EK7panm39Ep6Gs_hlyKss_7Ms9mC_01o7eDgxoJqRgqH9Tudi_mzYw>
    <xmx:Ea7pasn1Ec0ISS5__DG-weNW_Qzj96UHVwyc8HeYKvup-V9lQsJQp7I7>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 04:49:00 -0500 (EST)
Date: Tue, 03 Nov 2026 18:48:57 +0900 (JST)
Message-Id: <20261103.184857.703333269279645088.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, linux@armlinux.org.uk, ojeda@kernel.org,
 ardb@kernel.org, chrisi.schrefl@gmail.com,
 linux-arm-kernel@lists.infradead.org, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com, guptarud@gmail.com
Subject: Re: [PATCH v1] ARM: rust: Generate unwind tables for Rust code
 with ARM_UNWIND
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72=Mb7Vn9O0baOJFRf68UiZoxK0RjdXBFLw_hCHcqCkZ_g@mail.gmail.com>
References: <20261009124124.1176706-1-tomo@flapping.org>
	<20261103.182511.1470121559944018656.tomo@flapping.org>
	<CANiq72=Mb7Vn9O0baOJFRf68UiZoxK0RjdXBFLw_hCHcqCkZ_g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_014907_620214_5992717D 
X-CRM114-Status: GOOD (  10.50  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 10:34:59 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, Nov 3, 2026 at 10:25 AM FUJITA Tomonori <tomo@flapping.org> wrote:
>>
>> Gentle ping. The patch still applies cleanly on top of v7.4-rc1.
>>
>> Which tree should this go through?
> 
> I guess arm's ideally, but I am happy to take it with their OK (do you
> want this Cc: stable@?)

I don't think it needs Cc: stable. It only affects the backtrace in an
Oops or a WARNING, not how the kernel runs.

