Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bE6qXI+g;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkLDoAVu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdg87DJK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=; b=bE6qXI+gASWCE8
	mfrRaQXnXu7FDxfcuECVStclVpcjQL1khlUVJ1jrTvICs2cXIoHOf1JKGYYxqwqI/OU6bTxDpmm02
	b/JKLDfe12vgWEjCUPMWNE2bHZJNjPQmrWcCJXS9wHgz26XiE6gmkLivopQWorKEiEnCK5M8DTpPu
	fdgWyrkqF6Sn/SQM8s87l50JgD3Ihtx2oPxqfY3gohzIyBRmjqm5jjryJsENJzKKE72wXyFEQ4SKi
	LcdeuQXwxgIVE9r+ERHNDInOVn6fa0+UbRHrBq9ZlXs2VshiGHIZIAWP70bNt0FbC5XdAhx1OTte3
	QHUOVypLvq9TKWucqxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjsK-00000005KY3-1zyf;
	Tue, 27 Oct 2026 16:18:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjsH-00000005KVF-1Dbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:18:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKxI83085804
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=; b=mkLDoAVufykMfXU9
	b0wNwshi/OOFS1fGs2PUhkkdJTgKHecVqhmTkGvP5r4qVsM+99YVbuqYp42UzZBm
	2TI4maBCJKRfRPZLpK4EHZrA4GQCiz0sUK0TDussji1lhYQpdcZ+ik3hIJgvxnM0
	hZWRaYnTqGItcNiX0Kw7f9A/6jtt8D68cwLTH4CWc1agJ6uhZHLwqnGJA7wS3xzb
	vyELDZ4MGuWT4alpDXCC/oZm6s0T+j2wvi/ooq5od9IlQ9oV1WXkYa8UMu1FHjnR
	88tcaYIVwMLXmirQuw4xV27zS3jA/EgftwetVNFFnLWWu1MMo7IZQzPRqk+ELF69
	G8yO2w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtb957-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:18:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b7e7d5f56so1160996d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793117887; x=1793722687; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=;
        b=gdg87DJKZxzwLPQ6P4qZWsxD8gP+oT8rU2VU5taumKAMHpwMiZIhcV14m8A8Jmv/z2
         xhEVCJZwE47qLx8XSjch7t2cXwLQbpSxcppN3nYogkmM+ZSzmN9RwXywOKJ+Mj+blzxo
         vvgBt3YnutcFALbuQ7CwUWsC+qGHVMhpErMY6zIf3dSg/JMuMJIAcyVxS4rubKK+sfJG
         XfwrSCpxl9S1FuZ3s5VvJgmyVLJJpALgU8zUFEmdsNRf3ykKH5tV5dL0XLubIt0Ww1zy
         p14vQX4SN3181c97yacxRWYQaax9MtB+U4Q9H+wy/qmDDHnCvMnZIeDpwz1uSxU6TRb7
         0JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117887; x=1793722687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGDTuUyORqQ9ZtkZ7BRn3HYpiHLzxyIKFVLh6zS3w3s=;
        b=Wc4Z9tCF8Gw8mXCh2JAfgvGzEhWhUd7MLs5ANdDzUJBcvNQF+8MTYijsNeSVzqubGm
         CuhQmjn5MgWhHXojMeTr/11lRsKTrHbD26NyoSzI5fN6x7H5ORZ+G/dBiKc5qEPSwGmF
         WT86aU50itV9H93+o00UoHMcLmwUj1t+nHepnlYzo3cNXIHi2Dq0noCd6sKWxvhVuU9G
         j8ykFKRs1s+vwffewR4aPZKgFQohi9eIzJYJ5B6tpfuX9HdoG6VqRnZ8SpuqGCsTaK9N
         PD9ii3p/jXwYwCYvih13zMQ1r/Syahz9UNblkIDhmRk2Z9JBFv3Gn9olp0EzLEFfzkSa
         EHRw==
X-Forwarded-Encrypted: i=1; AKwUvBxTkncWEN5wS1g30A/4pLoy4h4ahJLwEQkLRn68S9ee6XAJdn5pWRtBW5J++VDGpfIOsBqX960ERjaHY1BBhVWn@lists.infradead.org
X-Gm-Message-State: AFq9FYKZb8pfyfqajLX8cEGCgdx2AYin8+Gc0IvfpjrqV7ckMsPeZH0h
	MEQZUnRm2qPwcFz42JZzH0PWeKvnQd2qH2cdG4tTcdjRdcTc6YjszOwaH3FPh0X91XLWpAP5ByR
	TErSRAQGroYrv6A0T6tWdWzECzQVV0uYLJATQuOH3PyrpRQ0nh6aanwF1Blp16EzzPCZyM6Q95Y
	Z/MA==
X-Gm-Gg: AYBFou1X0L0LwCiiDwOhFBPi/AZjyaTnqC7ZUc0oW0Axkng3Xy07+Yy07PGdBSvDHfJ
	N6an2jA6cky/Yu/41M4ADklZ9mgAtQZWOlMsEuSByEfg17WedGbOM0hK6ki7Qh8NYm3oVHvttbu
	qROlciC70m/qHbXMNKgH992pxO778cq+0wCF66iLa4vyFM4Z7Qw8dNyZPk3Uw/kxntcIFSZz+ib
	1Amp6XiGqhFek/Fh5M8FHo9ajbduf8+A+r4KwGi1a/91aP9Z2v0WD/lSYnrsd8Tw8oP72NPiyal
	b2OmYVaNJZG18i2hFO5jwEf/z81OCq48wo0NYxD78Gilkf3NEdtf4vgoL7Suz2yVXXb855SRRcE
	09gAEPVr4vCCmbz98K1fKXgqF5Y3WkxP2uhUP1aRGyKzgKdTaAKp/MWCUaUHa5w==
X-Received: by 2002:a05:620a:2b91:b0:93f:6e05:22eb with SMTP id af79cd13be357-940ef8f9253mr1634333485a.48.1793117886918;
        Tue, 27 Oct 2026 09:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93f:6e05:22eb with SMTP id af79cd13be357-940ef8f9253mr1634328585a.48.1793117886452;
        Tue, 27 Oct 2026 09:18:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm25927477f8f.48.2026.10.27.09.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:18:05 -0700 (PDT)
Message-ID: <8e53d1a3-fc96-4d07-8be7-74f383ed3618@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:18:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] selftests/powercap: Add powercap hierarchy
 creation API tests
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org,
        Thomas Huth <thuth@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
 <83799bf79e85e9e2ab77140e632f11d96b17a04f.1792504834.git.daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0gSLOP4KN3bNB425SaYOLcpJ1c3t5isYEQAdvxqQR0sVQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0gSLOP4KN3bNB425SaYOLcpJ1c3t5isYEQAdvxqQR0sVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NCBTYWx0ZWRfX7T7TkwWHAOhh
 kZo/eP8rNPYzLxBv5sMbTua9VwQFgaVl4R3G+VTf1d59asCxHPAG/wYpL70GYfOHJUxkWAXBh+1
 rB/rhKhZiHyA0lZCtZHXt2l+8QyYdVE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NCBTYWx0ZWRfXzm3zQdi/xrrc
 /0sudfT45UbUQiWy+Jfdncq96T2gJDUOUQuOCdnGIrBdp8jHt+obSKthpKzCEjKZ+YRXNUZBT1y
 /AnAdA9bFzls3BEHjVudBioNo0gEelcTGiEU95BcGNt73mhsAD4136KeeJyoDOsrAYDVn5z7P9z
 A/R5JntcFW7bX1FBJBKm2FByh8H8Uia6AH06wmHkAiAu6KcEd4GmiLq7gVzOCJvzwRBI9h1AOWY
 m9+oiX8KstsScDG1fXu+jqsW02iplR5w1jt2l4SLhbAgE0SP9k7ketZLJrOZFha4zyIdseINCvP
 J3euMF3+evxwVP9p/MzQcv6JxKWa6mEoLOYS35luxXacMWxH1ocYDtfINpfnf0sxSs48+wxInsF
 OuTD79VijIJ2vq24cd1BEE/itC2iNUFK1XbQ40yjfxx8ZfbNDnzAK+9kue+UoNlC4KR7p+R/I3f
 IjDhJGysZq4M4n1hxYw==
X-Proofpoint-ORIG-GUID: 1A3xNTCvKwO6tXex9Ec9WaQB_VWLAZZa
X-Proofpoint-GUID: 1A3xNTCvKwO6tXex9Ec9WaQB_VWLAZZa
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0cebf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=82gYmaJqspjqQrwE4UoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_091809_460494_C3F5D4DE 
X-CRM114-Status: GOOD (  17.44  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/26 17:10, Rafael J. Wysocki (Intel) wrote:
> On Tue, Oct 20, 2026 at 4:18 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> The powercap hierarchy API introduces generic helpers to duplicate,
>> instantiate and destroy a complete powercap hierarchy from a static
>> description.
>>
>> Add a kselftest exercising this API. The test builds a synthetic
>> powercap hierarchy composed of a package, three CPU clusters and twelve
>> CPUs, registers it as a powercap control type and checks the zone count
>> and selected sysfs attribute values. It also checks that the controller
>> directory disappears when the module is unloaded.
>>
>> Exercise direct static creation, duplication, skipped clusters and their
>> descendants, reuse after partial destruction, and repeated creation
>> returning -EBUSY without replacing existing zone pointers. Callback
>> checks verify the controller, name and backend-private data supplied by
>> the helpers.
>>
>> The test consists of:
>>
>> * a kernel module implementing a synthetic powercap hierarchy and
>>    dummy callbacks;
>> * a userspace kselftest script that loads the module, checks 16 zones
>>    and their power and constraint attributes, unloads the module with an
>>    attribute descriptor open, and checks controller removal.
>>
>> Use powercap-owned zone allocations so registration failures are cleaned
>> up by the core. Build generated module files in the selftest output
>> directory and extend the common clean target with Kbuild module cleanup.
>>
>> This provides a regression test for the powercap hierarchy helpers and
>> their integration with the powercap core.
>>
>> Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Link: https://patch.msgid.link/20260806110159.69690-3-daniel.lezcano@oss.qualcomm.com
>> Assisted-by: LLM
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Sashiko is complaining about this one now:
> 
> https://sashiko.dev/#/patchset/cover.1792504834.git.daniel.lezcano%40oss.qualcomm.com

Thanks, I'll have a look


