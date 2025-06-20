Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA1C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pKDq8IkD7Gp3uCohQ5thcPbl5SLnAvtiLxz8LuwTUU=; b=KQQY4GO+bK1BubbjbR4KCYDbzs
	Lxl1HLPx6+gb7kHKmX0AjFLjRrZogJ9rG0nWx3X3fCB36BJwiXE7E3cuL+rB2LIZo/Bl7i+Gl973O
	YuVbqPppXa2sgX0+sjrqQEXKrWM6sPmsqdtBtXLlcNbcouSnDt4BSqt7dE7nwFK6sqv+8Ij63a9Pf
	xdOJsuzMY+RFxUgJDPk4Mt/JInv2TizpsZvHcIPCWGGwKqvzPrRMq9JrownGBy9fqppH+Auwmf5ii
	TNz0L6fJsqBoCIOrFTf2c3shhBPD0uM6XRURKI4vPrkRdhi49mFmyFsW3euteRFszYHVJy1h7xK/n
	0qFXqpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjZL-0000000GeHJ-34ox;
	Fri, 20 Jun 2025 21:46:43 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSj5v-0000000GbFA-28vx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1750454164; x=1751058964;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=/pKDq8IkD7Gp3uCohQ5thcPbl5SLnAvtiLxz8LuwTUU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dF1kMzth5ZzrBDMTwLFwF9s91xo663A4skSNoKVyqRDDqESW4ecgJa1g5vI5qYlc
	 cQZJQdLb2DExntKg4EP2CdE7XfCXBwXCDTKtwkZxfe7Wsnsb1eO/H9amqq6DFClYV
	 r3mITW3zoRH40uFPwpEYjJhSbEae5oEb0ZMKx8voJZrNOzQFpqiYAouUo/BYRbaIN
	 8Yv59rC3fxEeDDBZO0vLt0OgUgp01/T40OEjYk5PEkIMAiPnidALYWrtHL9dl9cbb
	 b8XuIPNYzxT07WiQZXdzQUBzQg0+CqpV9LiA1J3oqbRNdEWqsiElOzK5K8e8kOAz1
	 QIoSDaxqvjaNqOvWJw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MDyc8-1uaSKl32HM-0003Lx; Fri, 20 Jun 2025 23:16:03 +0200
Message-ID: <33239018-ea33-49e4-87d2-4d5c399dda9b@oldschoolsolutions.biz>
Date: Fri, 20 Jun 2025 23:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 0/4] Support for Adreno X1-45 GPU
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
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+4YE6MTuUgvgsp65a+V8AX62NWNmLb2aNAbb/aU8gVx1rTyqQ7I
 jIfDf8NURnQva8qIefL59RrZ8H3hcVKWVwMk0b2yVPyQU9pSAL896sUdq5gsFkQAfFK2t9I
 roVKD73VNBILh4vVemSmF1OhkuYV9Wf0sVca45PoxpL8F7elWwNR9ftsbQSMgrstwWEF7Cg
 RNPAfuMCsikU7jgwcPx+A==
UI-OutboundReport: notjunk:1;M01:P0:L7p3mqP57R0=;Yf+zHyW9R9O3+3Lcv97T4M3IQ7R
 WMTMefP4P3sEZwafIrNDEyOWOkSf54qAjYd+5JdqK+Kv0TQn4NeDSne4Hh/KcRt6LDWObnGRT
 2+Us7JtBAwdT4SvNQ+sYKaUBqKojcV5MoQDB2w1y7V3io5LrVT+2kD8RJLOglrImOofL0KYIh
 nGm/2ZS+EYUdwITYhMbroaabQ+ULJqwTAjiQBz+XwfunVgILNLSJZG4zwfaceLR6tVIjb1qxv
 bkMu3H5WbYix6outeyNL+1u5FwXNZZ2j/mtdqJibgf7xAyxvfrcrvqkaozxyNgVw5pqkWoCg9
 b9DEw72rJTOKW99nRhZhB1pBJwkIhB1iC5V332T2kNBUv8/dPWYTq03YKRx3XjGhaJU33hu8P
 YFT3G/oTVvUfZwdvDV5x3yv7hfpPOSAmGbdtGBWrnvsjBt2WdRvSqX2eCxvTbt9wodIWqa9wY
 yiQ820AxMkMCmrYUeUVYrpfYtt/mCRd48cKo4fUfinnSF8MM41fs0oK44m+pvnbVSk2R4147q
 igaYnf6mKF+AtD5o/ZvNonP4c5khkj11h6P4XrPfcQqB/iI7dITzbqcOx16pDJm9tR2LTusRq
 gIImiPeM5SQELR8J9l5yZCswbd2oPlbbcAv30O8JL7cbAac6GtdvZyszdTL8uzapaOIeGScmS
 Zb3kO5D2WeCuos+i/B8F3BNKmkK/JJ9NzPXpJQVhQWnnKFHT73EWHGbAg9vufUnkiWt75nR6k
 8w3DZcQmEK+zzryFP5tgrp5DNSZsyrMGWG9KaTmOC17/PtL9WOHhaA7jqB8qwLGRZVNTGnkIa
 mbmZ66OfTOJYYlrrIfOw982UdI2V/UXqj2aM35aFAO1Avm1DnfXsNyD3O9/Nzj9ZI0a7OEP1j
 LEeQ/xYjb3+gKPMYLrXC7WB9cqmxyMI1RFJoSoVMOD/EVof/19uqSzVcBda6cElkbfu0xFlRw
 3p1wiZ+gndSaP/tuRo1D+ukkyqGuKs0asT3fcUjPiDxyb9IMEznF8Gdz0X3pnCWh4WN7UTDFI
 sxvOJwc2WZWiqEU0+iP0CLM3o3dlf/N0ed4PtesDJCsW4Afy2l+g5wVysOOleV7ygs6lgxRs5
 AvJzzj+/ZQnLdf0t4cqkEBqv2jb+CfRS0EI+EKvTP+fP8rlo4U/GIjQrirQr4EG6wSB6LuNi0
 wjAhQGuPqGlZ2a4Ub9u53vh5Vbpn7QKww+pnrNUOMOMDwXQ3NJCg6xCeSMqh8F2+Zf2NIK+Fy
 D3wZFXXjHlF7A8Suw4Y6ub1DOr+5dd/XXXFc21xk3oUdiyH2nAKLe0yA3YJrO8BzbHnkUcPlf
 WNSjKnz0Uk0xpP69q6o8+4LeCsnllrowf6prZR2RQF5TgYqb9YJdO5JQ0QA3MTjhyWkNLFKmv
 SXASEXucMAXFfBOYmbjiLLsatULsRj1nXi2qbgrbHJ9Lt+vg7thT4DqtMa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_141619_982845_1B535944 
X-CRM114-Status: UNSURE (   8.31  )
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

On 20.06.25 08:54, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
> Tested Glmark & Vkmark on Debian Gnome desktop.
>
Hi Akhil,

thank you for the patch set. It works well on the Lenovo ThinkBook 16 G7=
=20
QOY, tested on X11 and Wayland on Ubuntu 25.04.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


