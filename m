Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB54606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gkqCOYMF;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=THmCEyxj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=; b=gkqCOYMFnBBu52
	Z+mkztzUdckzVSj57+h/sLz57FwDrSjSrFq5rBIFpMXRV7lKqSSTcb/577HvoBel0qUAYy4w5lXdX
	sOD9gzOuhI9DvqPV88sta1HXDLV0nYhKjZTZEbaljGuxWGUsb8zsSIzDhrxDomILlQQ1xXbQ3lkNk
	DwXcsFMPTLFe2kbheDzHK4B3HlXDfrPuteJRDMWBJwnC5NI0zRoSPc+GPO7WXqIEdS4bY8+cAzAH3
	f7nyP8p5yeQMCJwF0Ien+6Dfh4bfa1k77lpv7zpF4aMJauEE8SHAxIU3yp0v+PeGIbkFfxvJqdZxU
	+Q+3Defwx/zhEL4U40gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGuT-000000023Dc-1xjs;
	Mon, 26 Oct 2026 09:22:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGuQ-000000023Bv-3WA6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:22:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1527653f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793006544; x=1793611344; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=;
        b=THmCEyxjvD0eMOnBfuKAUJB6ueRihYgvvaQwCQo66gEbHZ6jfNi4G4zMRu3zQaZlTD
         6G7z8YXz5SX3gcRqq0KazX/ynmNrfbOHlzkdU8wkPnFHgN6rcUPm2eSyhhRaqv8FRPVU
         C1F2z7Yb2GmqLOxfgQrBscDslCk5+IFgbO/WhVIXsYTa8fSWj9svb2/TgRKVckatWogK
         NaSzdHpdJOkr++IJjBLjPSqL3eEk43bGNoTCIq190VEhtLtUPpqlYVSP5+j0GTBC8Rdn
         zosS2PJCVrAWmCbNAXqc/vFyXiHCGHYEeWU++5tyqVW2Y7EGrBFTZSxYGKi9EX6RGh3u
         s0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006544; x=1793611344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=;
        b=IkFjErr9pULpz1qRd3ztDP/jnpdVfLMzHnRrkCiZZPePIkbJwyKMs++IdyybQPMCmZ
         avDfMaQODyhSUIG71z6DAkNerP6NVBc4JxLp2r+5a6pxOQIvyUS7BAcxSF5wpRkUTMU6
         Rhf0B1t0ySpPNoDxY0GWGTHujSNWXfpi4d9pw5CEyPIgZdFgQYU4f+XfL5wkd2IUwMEZ
         zBt9mCrfnaxsMStnU3QpuV1yNtU1y1eR/Nl4QqrnvVr7SIAP7uGNWLBbSYlC4D6zA15l
         npNSrxhq5SHEHpeqL21puueNpQWxgGADsQHMS6tG152X0tW01YaZr0NROWsIvig5wlc6
         Pjuw==
X-Forwarded-Encrypted: i=1; AKwUvBxJJQP/DtzdLBGqZAf4ZbCO4QZjyp1JEgybmXiSHt5E234xh7Od4UrVJM0TIumJSCQ5v0E60LybuCHrn4qxFxY9@lists.infradead.org
X-Gm-Message-State: AFq9FYJWYwFJapDu4V+Ko8St5Pcl8EeWI4aWfTnx8VIPLNuW9dpVoBiZ
	7l8SkRB/SgInKYHE/uuJ8qOQ7mPqLAvqO9NRxEmQ/HRIEcI/WtN92K/9b67H8622Kvo=
X-Gm-Gg: AYBFou241m5UxIVrL0oseh+OsURDMtSIW0PnWraZffNKv+JGZHJdmhZLk4NTO6utqa0
	lXCAh7lF4rCHi7ibfuVvVWHv1MUamHrn1Df5OuWDBxCoilxZVGnXcAPRq+SkQP6N7gDHStYoGie
	MkaFGg6wO7Y16QGWJ9KsEtMnNEb89VBH7lR70wAjg+Rn4tLUctMp+jfVqO5jRBvnIfVbHNhpgjZ
	D863b30ytagBevtNIJhTcO1QkBMGEF9baLwj5T31VqZ18hgZBDjpGgpcDw5EqE3+CWS2iAx9M3W
	kmKXRNadHTAO/FQX+eZENuK0qr2HZlORERanwSwWd3o+DtXLqo0RY5SbE8KZzMYk4xU4IA+r7kx
	f/IW/V0JRbzm25p1BGplCXOHVKxik1N0ySEREbq+674GB6qmAJuFtfF3JRVL4u07w9kmpy/dEUn
	HdD8iq8nOSX4l73ZKcSurTSr9vq4if8keaHKa3nYfnd1qRQRiT1jAM9ovGEgLiCc3YLLZspuAAZ
	1X9px71giUxJFkju5C4F/cLn0wGZSqrnboD+RWKfAKE67h4dmz9Kt090yzOMA==
X-Received: by 2002:a05:6000:470d:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-48e3eb3cc6fmr11105736f8f.7.1793006544434;
        Mon, 26 Oct 2026 02:22:24 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm15042461f8f.59.2026.10.26.02.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:22:24 -0700 (PDT)
Message-ID: <1de1884e-11e1-4375-97af-fe3bf924a584@linaro.org>
Date: Mon, 26 Oct 2026 09:22:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
To: Leo Yan <leo.yan@arm.com>
Cc: Amir Ayupov <aaupov@fb.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
 <20261021164332.GI26205@e132581.arm.com>
 <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
 <20261023140013.GK26205@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261023140013.GK26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_022226_905700_4772CF10 
X-CRM114-Status: GOOD (  13.78  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 23/10/2026 15:00, Leo Yan wrote:
> On Fri, Oct 23, 2026 at 10:49:40AM +0100, James Clark wrote:
> 
> [...]
> 
>>>>     * a device that matches one of its classes and has all of its capabilities.
>>>>     */
>>>>    #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
>>>> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
>>
>> Isn't this recreating what GENMASK() and FIELD_PREP() does? Can we use that
>> instead?
> 
> TBC, are you suggesting using separate capability bits to represent
> TRCEXTOUT0-3? Why can't we use a single capability bit to indicate
> whether the feature is supported and caps->num_event to indicate
> the number of external output signals?

Just the pattern of *_SHIFT and other stuff to make a bitfield is 
usually better done with GENMASK(). Or if there are only 4 of them, even 
defining four BIT()s would be clearer.

But yes if a single bit and caps->num_event works we should do that instead.

