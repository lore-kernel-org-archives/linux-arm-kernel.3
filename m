Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8BBCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22ruvcxtukeWsFb40u9FymOfAi9ABkPxyopNdx14JWw=; b=0USyrZHdltXRBg8gK/FeG2/HET
	1tTA2LYPacjpNN4vhkMoNIkS0cKEm3P6jgxfPPzJpP/EpNVCJ7cnNDaU/FJz3hS/WiNOnpMwOGdwv
	tkSJQx26No71bBhIygnvTH+IAOFMX1KBToN4jKgvnRvopSxHEpeLCjQoMZ96JADMHUSukULxhGYC8
	YExTCTvtMXF+HvEhJj9rtvBgu2/wc+RjTCqhrnNo3QmGDQtZYQdCxh3EGyaBh89MhtYGrPRFVvr3y
	So6wCih3frgzQaL7T8f64jW4RkZV6EePbJhQim/fP6geslH1KzXvyExvtm+mpQL0oFsZiQIolEHHg
	2hOMAU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRUz-00000002Vqm-1NCa;
	Tue, 29 Sep 2026 06:39:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRUx-00000002Vq9-0UpX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=22ruvcxtukeWsFb40u9FymOfAi9ABkPxyopNdx14JWw=; b=l/bAcJ+uMKiMW57vj0uUPgjAdg
	Fwf83eEgzkZ4JvWRrEPkInkO0o692bitXIkdrONx3NTwWm/ElalchMvxeDCxsY7WHgDHi56QKO+ej
	R/jk9V0Fw2KXm4WOBzjRNwOB31ziCFrlB6uttHFbz1sFZ5iq/5SdG0kQUDNN72TsIgeucU1FOz9f/
	aUgcU19ZSnlraWIwoASwg9tmExV4QliIyAU34z+QvaxPCE1378nXPVkMmftFvrlrgqsr92sK8YXvi
	KhXNzzqxbjX0eGqrTvMsKcl9r6E96u9r6EPDD2oLLaDlewlVgkbSrokNK3OhHpLimocCdb/InQPnb
	51rioiwA==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBRUt-00000002Fz1-1J94
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:39:29 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fbef5018so25701185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790663964; x=1791268764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22ruvcxtukeWsFb40u9FymOfAi9ABkPxyopNdx14JWw=;
        b=b78H6ClbNdWKOhvwntrBH49cB8e8XAJ4UWhQCHZsbsUZaDnSb3EQC8vByqX2ngw62Z
         ifVuOzoEevl/MxqYL9rQ/SvL9kcij9AyGXP0pD/BifYH6VnfTE3I6WRzEN+Udax7E6C5
         +mWwIMDgwQLG7s82jaOsvh1c1wu0cPTmT35b/dWdIIQbYZ8p7lnc/DOkSEDrkDn1gctP
         gmcBRKv7yxfi+ojldJx9sS+HLkrwsquFbI2tcshFGb6ltv762Sz8NuQLwLjA/nxYC2Xp
         9OpgMpF82oABMdq1Gtw+0oGkOAKXFJrFKsGEi5L0sJrqDrzQhD/YNzW6p0VhqO9upW2L
         7NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663964; x=1791268764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22ruvcxtukeWsFb40u9FymOfAi9ABkPxyopNdx14JWw=;
        b=AlHY1yWeCuRcb4FYarCvUIK8/9d6mtxiF2wi5laAfx1+4VajzZwKCQs9A0Jwuxy8d2
         HOO8Szu4Bkpp7w8itq6pO692meOl/gRPun0UHQX1KaSNaFH7PMSOZ8NL+Eiwvxg9bq7S
         mW+VJpuHE964j35I2FKma6LjZYYRZafqYLfRR7rjyNi2HlMpHJDueCFuh8DMKYycz4ou
         dQZPcTqm/8FkBWKGygLF97m+1oWvbxnjy2coP0LaJYjDHJBcRyec0XDn1E2WtrVy9vjY
         EA/k6A4/ZiF0/SGywPa1vxedqurFQuIFnOYkatQMVFQ4bvv6DCJheRAqhEbqPX1NTCgu
         402Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3ynxYhYsaT5J2zstGezjT269bsvGgjYjRiAKMR1ETd4Gf3eEOmDcT/OsD4qsMsEXEHuIeYmvewOuwtqLuJmT4@lists.infradead.org
X-Gm-Message-State: AFq9FYL5JKEwGlw/xeDGfVgwZ0Lq5zkAmiVxaEWxtzlLL/yV+B2S3bpu
	O50XokWFBid/dKZUCZ1+HzZyAqCiyM9F4WZdRt7hb3ijS9k8DJT8m9hz
X-Gm-Gg: AYBFou2PxHpvZ3oWlEaJ31TVBYKRQuvwFFgkEbDXIuT0x4ctczsrH9TTdHq7J6FZGvw
	z9vYDrd3VwE12I0oWNu+BAfdFjKEgVOC4q6KI99oJYEaDXRoepR3TXiuVHxEpNyJzKUsp5QHlwT
	s5sUBV6mfAsc66aNRV0gJjbsBRjbJg6iq8qXbzy1ZvVe60U3VzSA7snXQEvFrZDXzIUbbsYLpCi
	7GFvRf1oMsaFmBmN9j0kx2wlHZbVgNjwyIgTYiQqFnXr+s8KqfbLymCVCxA0FqQ5u9XmzDObFw4
	K+KB0ZZM7VzdyKxtYebk68dMkj2v5cGwVovFPdmrWaLGMBCwekqMO1JzznBVKS5W8nzi5BjwZ/K
	YDTi000A219U1K0NrCPat2JuxbhWuwD2YZBdbr4ugkoNv6VhD9krLItTdiupkPwF4L+iE7mewDo
	KPB+jW2dhejG/K9f0n8tJZ4jfVPWFlRKYUW+ufyBT5Ha0jFaX2DTh3pBJZCemoMgfTrgSdW4PXt
	j6wGduOES32lOziaRDeBXJVJ4ZZ0D5BZxjfFFOb/d1vPg==
X-Received: by 2002:a17:903:2a90:b0:2dd:c100:3139 with SMTP id d9443c01a7336-2df7e24f3e2mr164122085ad.53.1790663964139;
        Mon, 28 Sep 2026 23:39:24 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c7822620sm4538185ad.37.2026.09.28.23.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:39:23 -0700 (PDT)
Message-ID: <a2fb259a-1e73-4c0f-bd35-6d59412537f2@gmail.com>
Date: Tue, 29 Sep 2026 14:39:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
 <20260921083753.1109826-4-zychennvt@gmail.com>
 <arpdMZ1KHd00_oLK@zenone.zhora.eu>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <arpdMZ1KHd00_oLK@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_073928_427398_68D5CEDD 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Andi,
Thanks for your review. 

Andi Shyti 於 2026/9/28 下午 08:29 寫道:
> Hi Zi-Yu,
> 
> ...
> 
>> +&i2c2 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_i2c2>;
>> +
>> +	nau8822: audio-codec@1a {
>> +		compatible = "nuvoton,nau8822";
>> +		reg = <0x1a> ;
> 
> please, remove the space before the ';'
will do.> 
> Thanks,
> Andi
> 
>> +		nuvoton,spk-btl;
>> +	};
>> +};


