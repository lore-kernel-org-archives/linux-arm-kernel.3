Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1248CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNy9q8E+jaKYA95rrAmxOa1YboE2IejBQgnmMkL288c=; b=EpcD9bCQDsS5X/xg2vk2cVr4Th
	49UDWdzKG5+Yx9BpKjcCJwXh/nY2jl8coQGePXnON/Qi3SaKeNYQvKqebJhdIsp1Lw56HW8bGHQTe
	lTB6hb17Y7lzXeCOhYJHqa0QBxkS0y0sV46XXEPqss3CMtKIH5g7RZ23AJ5Hl314v6G36TyLIOybV
	GwC/nbv9WQ54TOoj4we0OJCcsqXbKl/XNHPZ9UGQf4NTRN3XyYBqvZdSYoDjDuxJaDkOvWAV9gjn9
	MKMEoVSku1gmUabNhyvCaKjv4yNV/6yUyCB7E6vdZspVnv8N68tMpr5dBfe7oJeBRDW41xt3TM84y
	5yHdMCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYo6B-00000002vGB-1A7k;
	Mon, 07 Jul 2025 15:49:43 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnwt-00000002tcG-1HTx;
	Mon, 07 Jul 2025 15:40:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bbT2W6Yp2zm0ySb;
	Mon,  7 Jul 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751902801; x=1754494802; bh=hNy9q8E+jaKYA95rrAmxOa1Y
	boE2IejBQgnmMkL288c=; b=thtA1SXUtKqdE6w0yDKP75OWI1o/e8/VAs2EmRQt
	ySYhzHcqBG5NI8K4z6949nonnkm/OnuZKh+UQDZnhOoXGP6V9utxiH5qMYVNqn6y
	6gqV0hKbqRXFvm9pEwjK4R1Nk9Ka7ii+JZnyqLkkKIfxtmr+Aot+8HMzFTL0u19g
	IVnRM5Oxi+maxqVNc+n4CvwIZnCv92439lzc2dHqhxpUwJFpi+ef2XJgDMshHU/i
	n5J+GdiEmGf6W9HafRxNUwibr9SziBTLMwNrXO8JqM0b+Q0vcvlxqhTu/AiA0Xwc
	zr8z99TNQiZ9/lE/cVCXwvBQ8C/UEWKAFdmNHd/tHrhdfw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 822Kd6-Eq7YK; Mon,  7 Jul 2025 15:40:01 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bbT2J2NTCzm0ySj;
	Mon,  7 Jul 2025 15:39:51 +0000 (UTC)
Message-ID: <9f281874-21b7-4561-914a-52c8ef16b03a@acm.org>
Date: Mon, 7 Jul 2025 08:39:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuimhjogW1BBVENIXSBzY3NpOiB1ZnM6IHByZXZlbnRpbmcg?=
 =?UTF-8?Q?bus_hang_crash_during_emergency_power_off?=
To: =?UTF-8?B?Qm8gWWUgKOWPtuazoik=?= <Bo.Ye@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?WGl1anVhbiBUYW4gKOiwreengOWonyk=?= <xiujuan.tan@mediatek.com>,
 =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?= <Qilin.Tan@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20250519073814.167264-1-bo.ye@mediatek.com>
 <a15b8f6e-5ad5-4d16-98d4-79cf63619f6e@acm.org>
 <SEYPR03MB6531CD4D3FAD80339F8E693B944FA@SEYPR03MB6531.apcprd03.prod.outlook.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <SEYPR03MB6531CD4D3FAD80339F8E693B944FA@SEYPR03MB6531.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_084007_442218_ABD99D63 
X-CRM114-Status: UNSURE (   9.26  )
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

On 7/7/25 12:49 AM, Bo Ye (=E5=8F=B6=E6=B3=A2) wrote:
> Thank you for your feedback.
> I believe ufshcd_wait_for_doorbell_clr() can handle both legacy single=20
> doorbell mode and MCQ [ ... ]

Agreed.

> Therefore, the current implementation should support both modes.
> Please let me know if you have further concerns.

The Fixes tag seems wrong to me. I think it should be changed into the
following:

Fixes: 19a198b67767 ("scsi: ufs: core: Set SDEV_OFFLINE when UFS is shut=20
down")

I will add more comments as a reply to the original patch.

Bart.

