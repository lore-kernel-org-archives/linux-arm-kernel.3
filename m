Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B61C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzM2SThJXQtr6zFl24Oqno+3Ld43dN90vFMCB/HxBhI=; b=Xcuxz6L6sWbhTE9mBsMG0jrSt+
	5Y6WMZ1ZH5pC4Fx+q5Ifgnitkid+XkxBKsvju0DURyTrrfarnTRfHTcjb+EFaAFtV5VM96vXUCpuH
	0WlDiFF3fs2u7C0L/J8zpAUypuGYFrxYxQ7LQr3klqE7Y7ljqK2hLyU//lKnXY7LddJtimlfB/q+H
	dK5Q6g+Z7iJWRlFkKPy/z5xZQS/FJDoPC5hBpKWGcDVPiReEeaSHnVhkYK4FGsX0B2kVf8qk0moAU
	IgtN4iOpsFIWTeef88+17nzCq4dLtqClUqTBefmyAargKR2hAnZJIw/AnhVeBoSAzsrERdWXGtUEa
	hDWY9A9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oMU-0000000FYip-36FE;
	Thu, 10 Sep 2026 23:39:22 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oMS-0000000FYiT-1Vb5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:39:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A52E61031B9;
	Fri, 11 Sep 2026 01:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789083553;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yzM2SThJXQtr6zFl24Oqno+3Ld43dN90vFMCB/HxBhI=;
	b=cCpzL7FPGzC0ImZ9y9sk8sJ4CG7EKEUiTLniKKt4X3dbPzjbclmNtCLxJDMG5S730PgTOh
	QgqDcZ3m9OqCInXm0u+DJvubzn4JGVCOZ74ixgLRsi8Y93kpPc3VmJpqWfcwYN26qawMMn
	iqyJSsqPDHDTrYsg/2vpB32Fzqq9W0HvVX/Q4AD5dhAsFE5/GBWwZiPFyeH7n4uv+HQzrW
	TIC94Jghw865EVmBsG/iqau/p7azOiCS92FAgcMWA2UUw2WsO+rJzudlAmxGQEzNxEXi+O
	zPPepGQsCNueTOyIGpBoLnH2kETtTf0eKFgMA5QqxQWpvdgZWrZEqRA4OOIk8w==
Message-ID: <7b957072-df73-4fab-91ba-9835285ff8c5@nabladev.com>
Date: Fri, 11 Sep 2026 01:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
 <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
 <e305b607-76ca-489c-b27f-bf45b6fdb59c@amd.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <e305b607-76ca-489c-b27f-bf45b6fdb59c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_163920_621375_94DC22E9 
X-CRM114-Status: GOOD (  13.17  )
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

On 9/10/26 9:17 AM, Michal Simek wrote:

>>>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
>>>> @@ -44,6 +44,11 @@ properties:
>>>>             - const: xlnx,zynq-zed
>>>>             - const: xlnx,zynq-7000
>>>> +      - items:
>>>> +          - const: ifm,zynqmp-vhip6-evalboard
>>>> +          - const: ifm,zynqmp-vhip6
>>>> +          - const: xlnx,zynqmp
>>>> +
>>>>         - items:
>>>>             - enum:
>>>>                 - xlnx,zynqmp-zc1751
>>>
>>> Can you please provide any link to public documentation about this 
>>> board?
>>> I wasn't able to find anything through google..
>>
>> I do not know whether there is any, it is an internal board from which 
>> other boards get derived.
>>
>> What would you like to know ?
> 
> I would like to know value for me to maintain it. Why should I care 
> about board which don't have any public documentation and none can buy? 

I think because the users of this board actually do benefit from having 
the support upstream, instead of having to lug around random downstream 
patches in assorted state of decay.

> There will be thousands of similar boards out there and I am definitely 
> not going to have all of them in the tree.
Why not ? There are users who benefit from having their board support 
upstream. This is what other SoC vendors do as well, it does not seem to 
be a problem, rather it is a good indicator that the SoC has users who 
care about it and about upstream.

If you do require a sample board, I could try to arrange that.

