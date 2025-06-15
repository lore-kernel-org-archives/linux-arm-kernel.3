Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CBEC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onUUPi4Wsm0wWvtRzn7J1Is1tHETTLIUY7qL9YrjcWs=; b=rk9WNx3gprY6SH18v5cWFIA+OD
	ntNL00apHntL/HbSa6xnQG9Gy6BztPEGmsA9rg9ayu6AYQtUy8Nkom8ZPz0+lbaOC/2+5DsP8JZ1y
	VygOa+5MPSQXcWjueWCOmubysqL0I9Q/ED6HSY4D14N2f2LvsZJaZIDFbxYsemLPaa7cnn7cGaFro
	llL+fdN8ia9v5WrEPa66O5JCd+wP6X2XzWtESn4feEkY3N65BFJFCIkcu/uR08h/651Bv3+UmC8vz
	CETUNlUa/4KhhrSrptS0BM80LUFurqRD2wGoJuCsHmT8gS8qZUe9Vft5bZgo3brC0gDXA6VzU1FVP
	NWKaw9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQuEO-00000002qSW-12Yp;
	Sun, 15 Jun 2025 20:45:32 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQuCA-00000002qF7-1lAk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 20:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1750020173; x=1750624973;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=onUUPi4Wsm0wWvtRzn7J1Is1tHETTLIUY7qL9YrjcWs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aAALW427wCiTHK39cJJv2kjo5O3E9Pc5agRqdW8bWA+LeGPYnK0+OoD+wSPbGNMs
	 a/bk8C+aLobCM408Blc7Y+YD5VqacRjTkSU24zOz9Kj5FHMA/mBtMhhmoQbGycgrk
	 tKEeGeP/NKcAmVjNZfpC4fpqsfyRFYhs4rWuQp+UByzpEVnljo4K7AOdFLRFnWr4t
	 t6VM5dzTGFyvp9zXYR2gRfAsS9DAy018Smyej00I3g/f9rUEYo8dt0lKNPVputYfC
	 ikij9RCwlYOlkf75sF5x9wMkSszH2JPLwnx/doEdtr0cKa/MO9PS2ePMRT6wa+pgE
	 /TjBIkhEtH8JRwbEXQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([62.226.41.128]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MqsGv-1vD7Bk1UkT-00lJbT; Sun, 15 Jun 2025 22:42:53 +0200
Message-ID: <df125ce9-c271-4cd2-b9ee-798d7b1c8648@oldschoolsolutions.biz>
Date: Sun, 15 Jun 2025 22:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
 <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NPypNcwQLw4G4JWfH5eQewUs1fAhXA4gnmLwZKj+YXP2JQCVDLw
 hHHaFiRxV8yKAi8HhsY8i7ZxODi73S6CjKM9nVFccdGkPhfkB5pOrBOyVW9yaBNN4b0H+Ns
 dg9kfLxx2wyWiBgoyv/B9zEcXS+CPe57RHvxQpv2+5cF8Zfq1sB+eFs/1EV0GqXTBh6gg++
 +pqFx1RAv2flOXyJR+vlg==
UI-OutboundReport: notjunk:1;M01:P0:klnQglAAmwE=;E6ZFj467byVMRokAgVi3n9DEdRR
 N1m/VSAojUu+ULxgCdZ4o+cCjlVmxVqa/sFULgrw6SEKsIo2NNWw35rUEyudvLLsVmQK4Z3p9
 591we6xn+bjnbhuu92332R/BK6nyJg75u8PVumSroAKebZIVkhWrNbtqyL4RCzEamfJlIsHg3
 Q1An5m81MgIKuU59h6/exUcKN3r0iMrAs50XrEeUQeLDrYY9E+53WzWLlq2fC6NA2KjrX8JaC
 gZOw95SRi5w/ifsbqET4WItvnvvSPuEniYP4n5heEBpB1vHXrmElJhhtN4BRiuBwL5OqFEdS5
 NZGYR1ut3tvw4AaLB72JrG5VlIpTo+opklz68zFKwM38VZx/MabOGpv/umwEkMfcNvjlG/pjo
 rESxS3yShxjydsx9s2Ns/tZz/8gc+ikVEQCYyq6vk1pUaooWxZA5vMJjMuHKEdyw4e498DCor
 WG8X17Pi3eXakotXfmGvHB6AWJRWKIsHNC8+vOWJfSm8Y4m/O0PtuZnhnvWyD92CVMeKu4XQF
 yWCK++uPU1Zm3TDk0tEHCewFA9Vq52o7yywfM9/S3tlTZykC614j+z6R1DJ1RNyJc4dEqZmtg
 B+OwBWNJiShSqxaPQlg/6oeuujHaFFfz++nU6Xf0pOEMWPpPqsxzoAzAkIyafeZyrk/Q5rmFr
 1fRo+JJIAzSVVyyc6MvlIMvA1u5sdgT94lJaiEXBl+R1PMa/fCs/7GRVfH/MUNhQewq1pHxNO
 tJivuh+YxIiRvz/HgkfbrSG8gK4MycVAiN8T+rRFG5+0rM+fKbjaDyxWo++mucpT3G75rGtq2
 wfdXKfA4euhbu8XN8lEpe7XQJu2zkNy8NlzZgBApFiw6EtuGXAEZZp85P6AKyZ8ExF4/HQaKd
 xZ9fgizegncf77vAwsnWhBykpNH6a9whTFOhRp4TwiRIzfEOb+IshEj9XF++voXK44mQhwOZF
 6tdBL0StGxlPuziwMhDjfSaoDaTY8xTVMgIaefvlBhHIHOpQJHicXlZPGLsnspzpzrgDcZ32/
 sFOGfjHxA5lPFtseLVEaLrZQzK9OSDEheJNc9hd85+vCHwr2zqnWFaAa88Xa/NEyvK1De3A3G
 hRlpE1fkiCpoaee8Qw9jJxHHBBwi3uCZYkrkLH4XBA67ydVj5WK7MEDsw7UVe0O/aY35bq4Mw
 rlvKdCFwtLAtvqOnIfYj6NslmMJTqHS3655lLfIILocFlIl83vmvO8HYdyzB8Ywr4IqPEwq+N
 oXYgPcyehI67+KnUBn2wkBNlBUhy/Jk4/5BtEEhmfnj+nbYP42HYRGD3g6VRB1iher4rXqrjf
 HGT7hQ349cRxaVSkYw9HPNyXbw0MV7fBQmGZBd1w1+0/SDtHhcaca40bKnvADp28METqZVpa0
 XzZAMSDylIKBf0zvqJe7mfrDIev7ODjahDP1ZNbB+/b1VZcgienlG8PIOp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_134314_916084_285122FC 
X-CRM114-Status: GOOD (  12.06  )
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

On 12.06.25 23:19, Akhil P Oommen wrote:
> Hi Jens,
>
> Could you please try the below patch?
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 2db748ce7df5..7748f92919b8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                          { 0,   0 },
>                          { 294, 1 },
>                          { 263, 2 },
> -                       { 141, 3 },
> +                       { 233, 3 },
> +                       { 141, 4 },
>                  ),
>          }
>   };
>
> With this, you should see 1107Mhz as the GPU Fmax.
>
jglathe@tb16-jg:~$ cat /sys/class/devfreq/*gpu*/available_frequencies
280000000 380000000 550000000 666000000 720000000 825000000 940000000=20
1014000000 1107000000

Looking good. Thanks!

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


