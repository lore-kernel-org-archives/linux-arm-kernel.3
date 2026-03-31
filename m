Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81675109B489
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jpxx80URzNBRSO9M4kIAxiBfPa78VaoakULnXtYzC9w=; b=OzvNW+5+i5JXNvm7+i5FU7bSYs
	TdCzcbXj3JmmaxR8upyWFHPEPSrCLP9PEETLYxgb2V0u1yVA+HGiIVmnanw3B5MskoIAXPzqjQkXn
	beWMYDQ0hsiYa+qsu+CEWmIGyZzYaqxoOYcY13/urQcgPWNiqGDT6Cg7eUWDqtuQSjA/ZAdyzYBNR
	BjL4zGQWTjMEAWyzska6Mk3Bgi8SxC8HnFXNiv2ORXU/+6bfwAV6f0dHlqJleVYb1MXsu9vpbPmLL
	j8hxcARnb19pMYP76sVQQkYWOWqjwQos4hOML5nt8syRQ1qN0HTQQy9cUuIRNuB11MJ2I1YOHiroD
	GgdFJVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7b1V-0000000DBLG-2EY7;
	Tue, 31 Mar 2026 15:28:57 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7b1S-0000000DBIw-40SK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:28:56 +0000
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id 7XvCwn10YObRf7b1FwYFOD; Tue, 31 Mar 2026 15:28:41 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 7b1BwKLQVeVHC7b1CwWIeU; Tue, 31 Mar 2026 15:28:38 +0000
X-Authority-Analysis: v=2.4 cv=TfSWtQQh c=1 sm=1 tr=0 ts=69cbe829
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=_Wotqz80AAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=WdX8k5g-n6Z53etAVCAA:9
 a=QEXdDO2ut3YA:10 a=buJP51TR1BpY-zbLSsyS:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jpxx80URzNBRSO9M4kIAxiBfPa78VaoakULnXtYzC9w=; b=G0QFnCezdj9n0kysZVYl8kce9J
	9vNVvW0DmKzLhMS455wQAVBM4DiRJ9Ar7Br+XUviTwI1SaDfZbEvlq8Pk5s3nHTpqyuv27Nuqjbba
	/wKv+nxnXC/oemXF/FASe8OEDTcCYro9PnrVUQ7vW3S5DQugDhmRupj6d4LdQgZI2U3FeHLsawPj7
	DUDCt1isfXUnEyM4dFzmeinS5YDAJK7kX2CmCKSk6mq5NSgDOR0skoU+KJhS1CQ/psIEyyJFecxpY
	ewTZnq61Pfkklc4U87G8wLffSXmzgH81gA7mafcIInLrW8L7v0jP0ko9RLWJs99wrkRF9FON3Zvh4
	URtCK7qg==;
Received: from [177.238.16.13] (port=60002 helo=[192.168.0.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1w7b19-00000002CdC-0QPD;
	Tue, 31 Mar 2026 10:28:35 -0500
Message-ID: <f5ae767c-8d4a-424d-b11a-d2a54127895c@embeddedor.com>
Date: Tue, 31 Mar 2026 09:27:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] clk: kirkwood: use kzalloc_flex
To: Brian Masney <bmasney@redhat.com>, Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260330205504.10143-1-rosenp@gmail.com>
 <acvUoSOOF_9UQC75@redhat.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <acvUoSOOF_9UQC75@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1w7b19-00000002CdC-0QPD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.104]) [177.238.16.13]:60002
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBC40ZMmXsnYDaHSHujykHHmxiTEJyQsVKJ6N9/oi12VALJggI3sYGi3MpEpikT+wXONh8nq2fhOoqlWCpAw/9NmQqae4OWpYOhK5s5zkyNmfW4+Zd4X
 J0wjXn70z1LHo8s1DQJ1Qh6rntegt8/yo6LcR1dYvwnpI+f0m/w51J1NZmKbuf3478jsYXsnPF9AhVa51eh2MoQVYkzUL0ofqs4enWY207ya2smJlMjDFoIV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_082855_106708_E46691CD 
X-CRM114-Status: UNSURE (   5.77  )
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



On 3/31/26 08:05, Brian Masney wrote:
> On Mon, Mar 30, 2026 at 01:55:04PM -0700, Rosen Penev wrote:
>> Simplify allocation by using a flexible array member and kzalloc_flex to
>> combine allocations.
>>
>> Add __counted_by for extra runtime analysis. Move counting variable
>> assignment to right after allocation as required by __counted_by.

This is misinformation and should be phrased differently[1]

-Gustavo

[1] https://lore.kernel.org/linux-hardening/37378f49-437f-438b-ad6c-d60480feb306@embeddedor.com/

>>
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>   v2: remove unused goto.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> For the future, if someone asks for changes in a previous version, then
> be sure to CC them on the next revision.
> 


