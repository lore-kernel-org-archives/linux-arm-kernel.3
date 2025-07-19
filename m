Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BCAC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90pU2e1eLYaELupxXm9ZCDsiNpayMvp/kDIj+oZWPAo=; b=I0WChxAP34uhb4NkRlvfWw3A/M
	LUW/0UAzAzcTquq8aP6XPZqBxYukeYB8+vBJuJ/OG3JstVS1Da2zGDcVVJLBZyCQlSKZmGKZ3ly4y
	oCiuEEHgvFMbmDB5duE6Nmz0yHspAWyKhEodEsxdUzyo2XTBVonWo/8pdDh8mp8pa21dbPugVSMfs
	QH/Rw5QiqtZz7NxR1viZCzFYqzwdMSRG8wM3drOEZWeoxwcdZSRD9Fa+lmTs03uKjioxqId+ibgu9
	fgKZQ85+z/o+3wRTPenE+m9RsWz729CnJIURX/pXNjly1USRdnOhQQNITXHy1ckHnITAEwsAT4lvf
	Pv4J1/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7Vj-0000000EIcH-3k4l;
	Sat, 19 Jul 2025 13:21:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7Fd-0000000EHUh-3DCo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 13:05:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 371BCA4D6F7;
	Sat, 19 Jul 2025 13:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2D6C4CEE3;
	Sat, 19 Jul 2025 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752930315;
	bh=v2lHPjZPKgeXJcLAgsu2mcNkm2hNRJJ4aWcXRC80BmY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FZX/JGwOvv8QNFAy76R+hFqnrT4CLCu390CTjjAGnE4SNiR7oR/HWbx5csBUskcJW
	 EstRTwfIrB+9cfAsn9KDJHr4E+p9lTdpzzK9nAB71+B8EwUi0mB+OPyDnv4QJvcwKw
	 DjDri39K8ormqkcfjF+W2nh0Iejjwuk51zXvp/T0t6PuQlmfaHuz05J0PWKeQuVyfO
	 H0XTEwgEj0yZKACT0kzVjT+8Ybc9y70yg5nLUQgyLQ6Izgs6cqpbq02eY6m1/PAHwz
	 BXxXye3MyHgQhzq+kCNeKv29Q2NLLgi1ixw7kqy630zAj6Mat83tMPLwXjyTwpCEUe
	 IGd8CXVQ1BKwA==
Message-ID: <75db9390-273f-4277-8ef8-dab9f779418e@kernel.org>
Date: Sat, 19 Jul 2025 15:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
To: Nick Chan <towinchenmi@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
 <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_060517_878013_ECCC4648 
X-CRM114-Status: UNSURE (   9.78  )
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

On 09.06.25 16:59, Nick Chan wrote:
> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
> existing driver so add their compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>   Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 

Hi Stephen,

I think the dt-binding change adding the new compatibles should usually 
go through your tree.

I can also pick it up if you want to otherwise together with the rest of 
the dts changes.


Thanks,


Sven


