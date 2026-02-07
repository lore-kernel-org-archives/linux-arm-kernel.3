Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F61EE20B6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7lMPW8pBbvT7wcRzwJ3CvkXCygjU0LKLoVquITywj0=; b=xgZlSwAxQPMsGuIuX+7gmnhJHN
	bHKF4AL3XSPjRDmMc/gLJLUOVXzqDXix8xA9oa8H0UPSUVH5O7T0rDlrwog8LzGRwrAfNI0zGJTTr
	KXukAO+ECbL34I2lfd8aPxkXPxrevsqSIS7g55KaFEG5YdYkjFX5Zk3x0qy07vIpCfqRRAY6g3rq0
	7vZFwVqCTBT7jkP32hg6iF0QPC8ybs2f7pcZkZbElao2r+yS5MAPWxbM3+8Xj0CcQW6O66VcZJ7P5
	KA1ZIXj4RSPMbKiWFmFJJ2ZQue7rJ2yO2Bae/jHtwIA7MsO4jUz74qpSLgXMpSonWEe/Ndq7NaLuO
	pSnDB/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voenN-0000000CHdY-1yxJ;
	Sat, 07 Feb 2026 09:40:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voenL-0000000CHdQ-42mt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 09:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1CAA6001A;
	Sat,  7 Feb 2026 09:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DFDC116D0;
	Sat,  7 Feb 2026 09:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770457202;
	bh=jrG9RSEunif7O8GyegfoUc5GoJ9UR+6jVRUgZBqZHD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TooQSJlk78bo8yJivj+w3wEy+/ojOg03JC634CjpnVYSYblWU1r8omCZlZMqzOcEk
	 lqcJSZeULvUFfbZjYBLCMp3fHBVjjCl6zHRH2iy3GO54RJEMCc5FQNT5v/Ft3UZesm
	 KIcLqBnV06qzV5+hpptTAPHuwug72c4hEikhmw2DMWdMtHKx1rTsokdaFv4shZUnpG
	 Vrw6qaS3/GarxBbLT5mXZb6RkMgflTUOcHE/FP9loaitKQS5jyDSZbmWHTC0csvsP4
	 XW4adS2FtZwL86cyXka+ROleRRAQ8EXMdtOPA8wFJfpcd/Hj+rm06+5giQNScjjU7D
	 LQ5Drz1Zv/qFg==
Message-ID: <50acc90f-1efe-4bf1-8c87-a4d3b6fd825c@kernel.org>
Date: Sat, 7 Feb 2026 10:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: Initial support for LG1215 TV SoC
To: Chanho Min <chanho.min@lge.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Kael D'Alcamo <dev@kael-k.io>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260112053421.3185738-1-chanho.min@lge.com>
 <aYFM+mHqhfCuWgRP@BRUNHILD> <af35d335-96f2-4404-a6e2-e85c68cb2757@kernel.org>
 <7bec9ff0-29c8-4468-9d31-2d2b483e2aaf@kernel.org> <aYZ/k1SuZ4dTaV8u@BRUNHILD>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aYZ/k1SuZ4dTaV8u@BRUNHILD>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 07/02/2026 00:56, Chanho Min wrote:
> On Fri, Feb 06, 2026 at 06:15:25PM +0100, Krzysztof Kozlowski wrote:
>> On 06/02/2026 18:13, Krzysztof Kozlowski wrote:
>>> On 03/02/2026 02:18, Chanho Min wrote:
>>>>>  .../devicetree/bindings/arm/lge.yaml          |   5 +
>>>>>  arch/arm64/boot/dts/lg/Makefile               |   1 +
>>>>>  arch/arm64/boot/dts/lg/lg1215-ref.dts         |  50 +++
>>>>>  arch/arm64/boot/dts/lg/lg1215.dtsi            | 290 ++++++++++++++++++
>>>>>  4 files changed, 346 insertions(+)
>>>>>  create mode 100644 arch/arm64/boot/dts/lg/lg1215-ref.dts
>>>>>  create mode 100644 arch/arm64/boot/dts/lg/lg1215.dtsi
>>>> Hi,
>>>>
>>>> Gentle ping on the LG1215 series (v3) — Acked-by received, but still not picked up.
>>>> Any update or is it waiting in a queue somewhere?
>>>
>>>
>>> Why are you pinging yourself?
>>
>> Sent a bit too fast... I meant:
>>
>> *  # email/list and role:stats
>> *  1 Chanho Min <chanho.min@lge.com>
>>      maintainer:ARM/LG1K ARCHITECTURE
>>
>> so if you are not taking the patches, no one else is going to and
>> platform should be removed from the kernel. Please confirm your choice
>> (I can prepare the patch to remove LG).
> 
> Hi Krzysztof,
> 
> Sorry for pinging incorrectly.
> 
> I will take proper responsibility for the LG SoC patches going forward and
> handle this series appropriately.

maintainer-soc profile will have valuable guides and expectations.

Best regards,
Krzysztof

