Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=txlugR1l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X2uug97+9g9Ifw2alnlucQZ1byzTMHdm0Mg+gmOCcls=; b=txlugR1lVRC5MC
	WX0nUixpKksJq5DeM0VPt+hn2ltvWhyxc7pDu4vfhs7zuCswe1M+0z1XIjbg5LBcU/MXKKlkbEDxk
	XincTNxSoRPSWNoMpVZjZg3EbIomMNHeVoB0z4BE/8EBIBEcFZDnyFdDJ/4WwnxYw0o07lffyCRYV
	Sp5yDTJgakp9IT0RaBMA8NVMukmLCOPkkAAM2M36vOzhdQAAk15uKt6Bv5FSoo6l7a8V6iwuA5hdD
	omBJn4+EDBPGrKvQNeZ5Q1WEagKFo2FSntxAa5lRoARgog0rF9rTw2gPnbLM6QjabRntrtgld4bcA
	daJVX+DWpUoaoboi8LoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwKW-0000000EZBW-2pJG;
	Thu, 22 Oct 2026 17:11:52 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwKS-0000000EZAm-1hBj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:11:50 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so28305f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689106; x=1793293906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2uug97+9g9Ifw2alnlucQZ1byzTMHdm0Mg+gmOCcls=;
        b=cb79iE1tq2w0ziAAjNIC6OwsYWNsL5LtCA1KXyKFnwqvZEw0lSN7JseRHU061SsGA8
         fVCio+37UCCE3dIn56zXwAqK4TMtVn+RNqPas2+VOWwxtxTo2Cqo9Di7daC7QJfLT1nw
         zMqTPd+tCyn2L95K5PrigcUW+nV4EJoel407vFNJfCnSw3qKQKhWgB1oEggvuvkNqKUw
         emI9VoGRkbRA1ClwHSw5d6Rmoe7e77iS4Nx9e36cF2NwJv59n+J2Eg7YsMmrto4rXHSb
         grGVjK5TIWgV5rXr+elspaftsA9PmKdIsIlwucH0j0WSmB3cRxum4tDaAv762CatQinm
         +Aag==
X-Forwarded-Encrypted: i=1; AKwUvBzv/cEFXAMcLleetr0fiO/EYgepnzOMRQN+D36TEnM1I49TJmFejuTO7k5Pd+6lFZGDPxSzLq9IXK0yjgVNweSO@lists.infradead.org
X-Gm-Message-State: AFq9FYISOx3we9OR2Oh3G7fGU40N6R/Mm64hfBgbd6WlumE1WitP6zeS
	CjfOveQPUmnOi4khM+MBQFPx6UJ2mHBsuCgBncKREylx5oHYMnOcoXxN
X-Gm-Gg: AYBFou0kdoJIC+JplG4C+6MBW85QBcLmo0wnE7LGM46M9Ry0k63PDylTFpID44uBpji
	F8wGZ0JkdQ2f290oI1obpIyzveclbNna3slu0k3vKvJJcVEFpYSOtWq7CG7OtvHq5s0qkVq9mC/
	HZTmm9D61yzyJA48J9XnIXpCIYY/AM1OK2Ans7i/QM25cT9CYOgQQkGppaepgy82VUKiIC+LNFb
	YJqLnCjPXCnXFgG7EOHP5tblmJtXiTOdsjDF3rnf/4/Lgn1+49DBZu2+JCg72uyygYEbZnxnBI0
	OWkqrUmdJxAlth38EZIdehq4aUhyMUo1sXLvjgh+0QoKUDYo/3XT57qjCAIi4ignoI3J3im2yYd
	hNbDwHWbp0vOXZBLPTlRgiCLBbvRng4GV9COHPNl33AZBEKP0ZMbmSPnf9EoUPKIHydYjrtWbU6
	W4ynb0HRlgLQ1gdiseZpBx2uqKkJ0b+R8/h2mx2OzirF9mC6tY34bhNrFHWEjqIF2Buhbaa/apE
	xCrmexCpIIuLHKv1u76KtAmkFiABriPfvgQ+kmBZzV0mvQwbPlMHL3Gc0G9BuP+lZnyZdBaopgM
	FlNA9pZsq+dQwNMB4RaeT5KbxgROLm0=
X-Received: by 2002:adf:e004:0:20b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48e264a640dmr8341797f8f.44.1792689105826;
        Thu, 22 Oct 2026 10:11:45 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm13532427f8f.32.2026.10.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:11:45 -0700 (PDT)
Message-ID: <5100a774-9c85-44bc-abf6-9679f8395856@linux.com>
Date: Thu, 22 Oct 2026 18:11:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Conor Dooley <conor@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
 <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
 <20261011-starship-foyer-1105c1b35e31@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20261011-starship-foyer-1105c1b35e31@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_101148_539431_4661751E 
X-CRM114-Status: GOOD (  14.25  )
X-Spam-Score: -0.7 (/)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026 22:13, Conor Dooley wrote:
> On Sun, Oct 11, 2026 at 03:16:18PM +0100, Lucas Tanure wrote:
>> On Sat, Oct 10, 2026 at 11:04 PM Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>>
>>> Hi Lucas and Conor,
>>>
>>> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
>>> [...]
>>>> +          - enum:
>>>> +              - amlogic,meson8b-dwmac
>>>> +              - amlogic,meson-gxbb-dwmac
>>>> +              - amlogic,meson-axg-dwmac
>>>> +              - amlogic,meson-g12a-dwmac
>>>> +          - const: snps,dwmac-3.70a
>>>> +          - const: snps,dwmac
>>>> +      - items:
>>>> +          - enum:
>>>> +              - amlogic,meson6-dwmac
>>>> +              - amlogic,meson8m2-dwmac
>>> Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
>>> In case it helps I can submit a patch to change the Meson8m2 .dtsi to
>>> use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
>>> we could move it here too.
>>> That leaves only Meson6 with a single fallback compatible. I don't
>>> have any Meson6 boards, so it'll have to stay that way.
>> Hi,
>>
>> Fine by me. But I think it is best to wait for this series to be merged.
> 
> In the second sentence, you're referring to the dts patch I assume?
> IMO, you should submit a new version of this with the 8m2 moved to the
> other enum and Martin can submit the dts patch now, since the current
> binding permits using dwmac-3.70a, no need to wait for this to be
> merged.
Ok, I will move.
I will sent v4 with your Acked-by, since this is the change
you asked for. Tell me if you want it dropped instead and review the new 
patch instead.

