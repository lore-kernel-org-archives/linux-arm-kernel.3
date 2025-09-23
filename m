Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE8ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 20:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1xrpqBgU5VRolmF7QTk3y42QIWpKPlrjBX+KzL4FgQ=; b=PY9xidCbWlV0gcR84xaum2e8TU
	h6/wQjC+4CsPcuki6S7sWz9ZqsTUJMizhZuCSv9eFZgVW8zJP0p+1rdnF/Gb4y69pA+7jOo8rVNQs
	hh7CC1D7lQl5y1uTjCvR+ddsEggYKAintl9ktm51vNZoYHzylaJq9SaWaqc0hfq2Qe6Xga513S7Xn
	AbzWMjrI50ErlYHriefwFNrh9j3S9h9Pztt5huuqG+YLyta4PFN8ggaVp9ozk35v/cxN7PKFR8MNS
	HteZaZ+8qRIAJUgrpIW+idyIC/Z2MCYEmuLPSKhKsnsuUCFbaUW2kcwiszfsar/s66G5V6+uURYCA
	PozGP4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1A42-0000000Ep2B-2btH;
	Tue, 23 Sep 2025 20:56:42 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1A40-0000000Eoz7-1H2t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 20:56:41 +0000
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id 15TrvwVfoZx2i1A3ovXrq3; Tue, 23 Sep 2025 20:56:28 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 1A3mvEF8Atssb1A3mv3jZW; Tue, 23 Sep 2025 20:56:26 +0000
X-Authority-Analysis: v=2.4 cv=Hb8UTjE8 c=1 sm=1 tr=0 ts=68d3097a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=N332or4wHRcdzxpigiEmqg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=b_psskLWchTY9WQLhBIA:9 a=QEXdDO2ut3YA:10 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R1xrpqBgU5VRolmF7QTk3y42QIWpKPlrjBX+KzL4FgQ=; b=UWgMXUTL32B3ppGQ/KieJsvITO
	iVwEyvAE/fLiFemHW/d712vtKD/8quLIAqr8Ra04bZa80zyszwCpxABXejd3p2yp9m0GYxjBAJhLW
	R+qZUeb4f7TU4uoAOzA3Z5bI/gwAAEg0B/Ttizir+kOEeBOJ+9yk1Lk1m0ylwUkXM+i7GIMVWJ+GH
	4PE5qXTs2yjETMpNecS5LXOqCUnO4BZ5m0iJV2cOLRyeYmVyD3fFZjM/aPe6nT4qz0gVof7WQNW7o
	kfW5HrPuleM/rjx15pKSguLzsQ/AsB1L3nnQWfR0dh7je8ojf6cGloMUttQvhRFUJobmCsYNhprcn
	ep4BtMCA==;
Received: from [83.214.155.155] (port=52914 helo=[192.168.1.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1v1A3k-00000003RJX-4Bcv;
	Tue, 23 Sep 2025 15:56:25 -0500
Message-ID: <e1c9e3e5-b04f-40d0-b05b-c119cf2d3cb3@embeddedor.com>
Date: Tue, 23 Sep 2025 22:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] net: airoha: Avoid -Wflex-array-member-not-at-end
 warning
To: Simon Horman <horms@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <aNFYVYLXQDqm4yxb@kspp> <20250923185525.GL836419@horms.kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20250923185525.GL836419@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 83.214.155.155
X-Source-L: No
X-Exim-ID: 1v1A3k-00000003RJX-4Bcv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.104]) [83.214.155.155]:52914
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 16
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNFGpo+o2ayguCSHICiGvWqWbC+wD71BR0Z8RhWn+y8F1QODzulOm6Mf+LCW2SGxhDoS/HoFZsLaczls/5wwaVxbhPPcnY2mVBS+RZ7eBznW2egJbLak
 tKAFXO3Beld3uFogaPjOnapY3dcnQHJSBFREeGvU8X+cDTtngtwd0lF/oA/38b7+2zQKljmrkq6PdDDTIbmMJqeTsn43Gx0nGlWoubrRh9TUqc8zincixq6w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_135640_369823_FFFC1F05 
X-CRM114-Status: GOOD (  10.94  )
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



On 9/23/25 20:55, Simon Horman wrote:
> On Mon, Sep 22, 2025 at 04:08:21PM +0200, Gustavo A. R. Silva wrote:
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> Move the conflicting declaration to the end of the corresponding
>> structure. Notice that `struct airoha_foe_entry` is a flexible
>> structure, this is a structure that contains a flexible-array
>> member.
>>
>> Fix the following warning:
>>
>> drivers/net/ethernet/airoha/airoha_eth.h:474:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> FWIIW, I was able to reproduce this locally.
> And it goes away with this patch applied.
> 
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   drivers/net/ethernet/airoha/airoha_eth.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Simon Horman <horms@kernel.org>

Thank you!

-Gustavo



