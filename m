Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA69C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiDyYekmZNMSivdab4Zrek7jwPATeBFWbRgjeMVU2kg=; b=NCQw945fVkmJYTvTi3Cv5h4xdM
	2w9ip17hpscZ00X97/RTRyF85yjPBmD1g5F4IPTD4z/dbxnJ3a1DvepfVywbs2/lthxxeBHLcEyPZ
	OGrxqoEA5cPn4Bvek9TjWLuEJdstrVm5xOe12lTqMIm2F1ZKRT0sR/A+LRDk8/VmFSjEiTTsKdLCU
	1j5Advmf7miBoCIWCdRq/7Ebx887c27hpEOUi6ng+qQzU6/yDvgtIFrK1EH+8wz2vegavXyOoL0QP
	JXnmMpy5CTpb8WCe4qlcYnoTCtmOKRN8J1oe1B4NZenJIzCqWDLQXsIX5VSaRzsRjuGUjhC6K5S6b
	xLSEp47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txlaA-0000000AqQX-2Vis;
	Thu, 27 Mar 2025 11:39:34 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txlYQ-0000000Aq79-0U2Q;
	Thu, 27 Mar 2025 11:37:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZNhTp2gcgzm0GTW;
	Thu, 27 Mar 2025 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1743075451; x=1745667452; bh=SiDyYekmZNMSivdab4Zrek7j
	wPATeBFWbRgjeMVU2kg=; b=HIN67TwmZCtgN/QnU4Iglp3zfThOppqJZmwn9gxR
	tjyKuoN7ymVRADOc+jgcxtdb+k9S5Gz6jWy3NQG/2kVJe6Dspu0XBZqFKfuV0E6O
	4rfMfs5zueHztCNMi6RWR/Ru18OgpnqfcyFE1ScSyij2OTMsOw1SIbFi7vo3hqim
	RdHjQ5CNWn282Zxly66VXILMTjSS2Z2tL4LNrRk0PBaX+P9XT61vutbANkWuZNF9
	lsMs4WlWUcYZLagbwJzjFp8bfx2ZA1dbiGSXpbM8Gki9nuIcGRUJyqO+0V8vu0a/
	xQRQD6+jhWx/Vz4ZGizHcYY+MdLA7eTP1iwlEbm/h73IaA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id WXirvB8zVYkM; Thu, 27 Mar 2025 11:37:31 +0000 (UTC)
Received: from [10.47.187.167] (unknown [91.223.100.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZNhTD50Rxzlmm8q;
	Thu, 27 Mar 2025 11:37:03 +0000 (UTC)
Message-ID: <3d7b543c-1165-42e0-8471-25b04c7572ac@acm.org>
Date: Thu, 27 Mar 2025 07:36:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: add device level exception
 support
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 Arthur Simchaev <Arthur.Simchaev@sandisk.com>,
 "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
 "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "minwoo.im@samsung.com" <minwoo.im@samsung.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bean Huo <beanhuo@micron.com>, Keoseong Park <keosung.park@samsung.com>,
 Ziqi Chen <quic_ziqichen@quicinc.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Gwendal Grignou <gwendal@chromium.org>, Eric Biggers <ebiggers@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
 <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
 <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_043746_220376_A07134E0 
X-CRM114-Status: GOOD (  16.22  )
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

On 3/26/25 7:47 PM, Bao D. Nguyen wrote:
> On 3/26/2025 3:49 AM, Bart Van Assche wrote:
>> On 3/25/25 6:15 PM, Bao D. Nguyen wrote:
>>> The existing "struct utp_upiu_query_v4_0" probably has a bug in it.=20
>>> It does not use the=C2=A0 __attribute__((__packed__)) attribute. The=20
>>> compiler is free to add padding in this structure, resulting in the=20
>>> read attribute value being incorrect. I plan to provide a separate=20
>>> patch to fix this issue.
>>
>> Adding __attribute__((__packed__)) or __packed to data structures that
>> don't need it is not an improvement but is a change that makes
>> processing slower on architectures that do not support unaligned
>> accesses. Instead of adding __packed to data structures in their
>> entirety, only add it to those members that need it and check the
>> structure size as follows:
>>
>> static_assert(sizeof(...) =3D=3D ...);
>>
> Thank you for the info on this, Bart.
> IMO, this response upiu data should be __packed because the data coming=
=20
> from the hardware follows a strict format as defined by the spec. If we=
=20
> support __pack each individual field which data may be read by the=20
> driver (the attribute read commands) and check the validity of their=20
> sizes, it may add some complexity?

Hi Bao,

As explained in my previous email, adding __packed to data structures in
their entirety is a bad practice. Please don't do this.

Regarding your question: I have not yet seen any data structure that
represents an on-the-wire data format where every single data member
has to be annotated with __packed. Only data members that are not
aligned to a natural boundary need this annotation. Examples are
available in this header file: include/scsi/srp.h.

Thanks,

Bart.

