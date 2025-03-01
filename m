Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAA3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ra8gIKFKFiVeUd/HquZVV+FuM2qhRTGX+65IuN5qPDE=; b=tNQWgYyAM3/Rb4nisYTdmSNMYZ
	8HkEIDHWzJqK+ErJpKH/eEaeZUzzWIAeGzQfdmyuQ18UVjTEUOa50S7fO5Pv6RmcBeiJCPWXgAx8y
	x3X9c6b4Jb00tDSCQ20Tocoi3xJelm3ct8+AQ1TurJLGn7tMSN0qpU7xOcb6b3rnyF/jvKPLnLXZ/
	0SPsLdk1pDBT4aveud1EzUxLnHhm3En8X6Pyk+p3hsEFCN6msYQC0IOkVW9wrl1LapFdbuGVtJBOc
	+8nQxt2OuZbAWELDEB0nSLfLDcPFHNyxZ/WOdlaOcq7kCJc4R1ZIG/IjTW7r6GVCVXWWpu2XUXWP1
	AxJW3FMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toM2S-0000000DvPC-2K2z;
	Sat, 01 Mar 2025 12:33:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toM0u-0000000DvJM-1EWq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 12:32:17 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso5357422a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 04:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740832335; x=1741437135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ra8gIKFKFiVeUd/HquZVV+FuM2qhRTGX+65IuN5qPDE=;
        b=D3ahCqygqpp7sCkPWOr0049yv+DsQQleSqdtWh1GYWHa8sZFF4+nqYgoJKPSpXYNrH
         sCLWVpwlbjplWWmhfnxOu0XWJQL/WO4pvlliVRd08TXleWYpOsY/bedC55DFSLzcuHeD
         287bLsfS0kiS6xoPvT/h5zjehaZr2CvzPCE5iUqaJpyiy9BgJyt55lTjqphB2NeuSaSh
         rqRrRfjewMxEBQQTxCrzv5RRT4bRdFpOtoejKH70jTqzLAhvK4/nGM6UKtYCHoUreN+0
         a6g9Sve5g9/vtEu5Zg3vmv7bL8qGILheSUWZ1/fnA2ZJX9U6bAqr8VUURLQ0p7iA94zc
         7hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740832335; x=1741437135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ra8gIKFKFiVeUd/HquZVV+FuM2qhRTGX+65IuN5qPDE=;
        b=RyzgwDBsDBiOOFHCAigoVoJ1yR9gvKci7JIszeLLLryET/+vHEmjko2BZ9qOcVmSqX
         o601yUPsEGN6yGT+dpwWOEDhN3MRhKY0fvexsIAFgqNp1mi3fdxs1GLZEm1xQKVENP5u
         Uu+NOVOBP4bduolXWhUKLAdAyJ0a1v6AdoY6FCv5R2zkwnaf0gs0z5u3bPWMSDJJnQXJ
         UXwfHUf8KJIh9Q3LWhvD+PYSDMgKvciPEi5dIRsN2XUap5od6pGGyTFwUJLg7gpJ/FyX
         oGIQlRxPC6KdJ9uvKQfmcUPZx0NcGCGb3jnjOBrXGwEOItqwxWmrg+/QySKBOENoZMN9
         x7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXwL06F7PklEfM4y+6PAQb+qQXE4JoHuZJesdLn5RxWzlpQ5kBwPa2mpPe2pFJ2FmAyolx++NBGsMFBlldVxeK6@lists.infradead.org
X-Gm-Message-State: AOJu0YwnLEPlX6tuj41EGoMlzs0VU3jSDodED8H1+CUphsBLuLgPxi1T
	mkdmw2ob+2f2oJoYWyCl9oPFWO4yhEy6S4lnpi1vJ1blbSGxqrXZ
X-Gm-Gg: ASbGncs8Fxt9c3VhC16Nd/+wTi40nCal/6F9v4RaBh7eTuvAjaLG9FWaRqK0kX9zz41
	uNsedc0IqamVmj8dpqwHkOXoKq+nXm3lEOrsBOinry9Krv5HlDOnG3bCW0MMBJFZoCaDCG+O1lx
	/aXNpvVmL94wdA57pxL66+X74MJw3jmNOMHi9kUZ7DC/3MmWhI4+YTs9AuzkIktzi6ZDFe/8Rb8
	x8wnSpWnemj/te0kjHunVDcHq3askk18lnl8uJ3QtvnhP2Wv97m1eT5fgouRXvk5prbVDiYwcvA
	8da/qgCZhUapaXvBtEE0Yj3HderfOHfqGkde0CNrfdQfwprjRioWdT7BoGpgFVF1AddC
X-Google-Smtp-Source: AGHT+IF1mhUuctMChazLjJnYgbLD4i8xF/OkaFyb4KVb61pxcTtGOZi+8D/BZaLS5+Cyjw+B2Dpcww==
X-Received: by 2002:a17:90b:1e51:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2feba92bfc9mr11663696a91.14.1740832334925;
        Sat, 01 Mar 2025 04:32:14 -0800 (PST)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825a99a7sm8346849a91.6.2025.03.01.04.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 04:32:14 -0800 (PST)
Message-ID: <83130117-509a-45ff-bf96-26beb77246e1@gmail.com>
Date: Sat, 1 Mar 2025 20:32:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] arm64: dts: apple: Add CPU cache information for
 Apple A7-A11, T2 SoCs
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
 <4670e5f8-2a92-46bd-8faa-dd3774517f3e@app.fastmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <4670e5f8-2a92-46bd-8faa-dd3774517f3e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_043216_334242_34911033 
X-CRM114-Status: GOOD (  19.28  )
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


Sven Peter 於 2025/3/1 夜晚7:11 寫道:
> Hi,
>
> On Thu, Feb 20, 2025, at 13:21, Nick Chan wrote:
>> Add CPU cache information for Apple A7-A11, T2 SoCs. On Apple
>> A10 (T8010), A10X (T8011), T2 (T8012), only the caches in one of the
>> CPU clusters can be used due to the "Apple Fusion Architecture"
>> big.LITTLE switcher. The values for the P-cluster is used in this
>> case.
> So this means that the cache information will be "wrong" when the CPU
> is in the lower power states and only correct for the higher ones?
> I'm not familiar with how these values are used; are you and do you
> know if this will have any weird or unexpected effects?
> Would it be better to use the cache size for the lower rather than
> the higher states or does this not matter much?
The information in the device tree is only used for reporting cache sizes in /sys/devices/system/cpu.
It represents the physical cache size which may not be the same as the architecturally visible cache
size. Cache operations in the kernel consult ccsidr_el1 and csselr_el1, so it should be fine.
>
>
>
> Best,
>
>
> Sven
Nick Chan


