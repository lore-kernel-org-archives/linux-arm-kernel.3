Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120B0C98325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/xSqJlOl7EjdT/3t/l47+j1hr0vJTFvoJBKOwjDyj8=; b=NDJ0uPmdi0+itliJ+YadTMIsjE
	RleCu74Qbjqj0l/v468NsBUyJaErdug6yxC4/qzokiTjUR+YfWytlcW0H2LoKj83VJ4uzAS1E1z2F
	Akh7XwCLP53z5QuZ1X5xBmmz1obljL02H9I8rPLtUPqxve9Qp+hAL1Yd1u3m5DjuqEwBurcRLkuOf
	rk1N4ap7KGr+ezLXhS429sqHlQMZwma5xNDt/soIxQ/ZTruxC4MuOPBmqPZ8u94jR/OMrTcoY3xLN
	NIy18Uup8JknfFZNdknGU3MJYVibIfmwRb5tmxVZnEVcM+hoM9EM35M7gbrURepn+Yd/p928WPXKZ
	pimeMoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9s3u-0000000CIUq-2sdx;
	Thu, 24 Sep 2026 22:37:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9s3t-0000000CIUX-2XC2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 22:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s/xSqJlOl7EjdT/3t/l47+j1hr0vJTFvoJBKOwjDyj8=; b=Qr5QiomIdLteru8m9gkYedaEeB
	pvWuXpp0eVxYkGIE1G+orCFm7qqfWn16sh4WthkVLBWaeGAJs9YVxC5XjjxFeHv6JdPtIwl05cTSZ
	pcuiPsMFUZTCay6CR79DQUzDlkIDgU0hMDi3lOw7SU+GS7MDiidamEuVJIy7HW6YB4a/iMum0XXxc
	hXNDuRhL3/9TJUkNcsykkL2+yXiVCCYrTdeUuMTj15w9qqr3ANYpiCs493GKVxF+IQQFBo7REcPlo
	ZO59qGXpfwx8XopceBUMVic2y4KNBqBH3OpDy0qjqdvyC90LG3yIMlW3n16lZ3Jy8aBlPpGovsgdM
	yZ95Mxsg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9s3n-0000000GTP4-3sH5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:37:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMP4ev3934425
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/xSqJlOl7EjdT/3t/l47+j1hr0vJTFvoJBKOwjDyj8=; b=PlUatk1n41tAzO1B
	PX1tOR480nktBDvXyTUN3Mch0LXudLeEAIlNhVxDbhygxH86COstmPZ3gjNoEbJl
	EUR8R35n2Wz4q5Ai2bh+pgYArUFRrY9puwtnMFAZpo+1yNIySROsTD1g9RPUqP4j
	seGbeU09R6Y3y7FmKgw4j+VtFbLGaHMZGrMszydloTiV1WebcdRGicYs1DoIv/tg
	X3TltJWVj/O8cDRNua0YU8eRHIvyxDDkLP73/P5YKXd8HvuXudezBWx1B1fJgGKh
	WaOCODTUzYbTGjBuTX0q4BkQKY56op1Yp+B6uHqP1gatpGMHKO8IdL3EFd8ZFqoH
	ioIIGw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjjx5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:36:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so360683eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790289414; x=1790894214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s/xSqJlOl7EjdT/3t/l47+j1hr0vJTFvoJBKOwjDyj8=;
        b=PpyfnKgYn+8tPonYvuyE1PmR0nJKcM+s91vMz/AZkGg7Le9NQTCK4oStMkCpKqXe0Y
         ryf47U7d+d2x6+p++/fCyDWB8tCoIyvDWLzSkP4rpLfbShOLKX04qGRcHKUHG4d6d0pw
         MTrYvTR0qTEmB/x05az9igSrbldfBTKR7Emeylg2pVpmTazffmsg4eFg9HRVo5HS6IhV
         FpRmJvHaP7INQQKtGxK9C0HwsoQ7DJthZSjMj+2+xtNbnFsAkev1I4X+b5ohvm1db0+F
         nMI7RALU+T4KBGHmtrW61JJwXOAZOVGLcSZhtsDC2TqorLzZpIYL9kWg0X6pbx6u/jMV
         F2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289414; x=1790894214;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/xSqJlOl7EjdT/3t/l47+j1hr0vJTFvoJBKOwjDyj8=;
        b=MP6fjZ8rG3JJz1CSex/kJidTZRnylQ1LyU1uCT4FSDDXpcCSxn3rtdycWPQeu/zAhJ
         dbdpwc8pLZiEu/ckyLJeXSntefJCxNndqyhMpc1WGRQIzPt3d7amtRrb0MCykkExx9Ip
         J3bkyyr8NnJcD/KxtYcETF/0403H8s+uW/srt1AA3zRwRlB+8TqYzzA0YMogSJsymRhY
         95g4ocqTKvFwRyOEw/ww45l3dnNsE5CgsQ7agzTq1+WKY1Hgq2DxcgcUhdoD0L3QV6TW
         a1jX2fZ47O8gLwWYSoC8twxV23TAPDdWWiOnWy/ZMS8zlr1RvRrDFpQq1S5Jno2J7X34
         IWAw==
X-Forwarded-Encrypted: i=1; AKwUvBzvM0p4crEgZgNXfe1oPgMKgWdTWNWDCWktABVOWJCz/mUI8DvoOhiDyKP++cTVP/YdCX8zlhTlfr0h3ImT5fft@lists.infradead.org
X-Gm-Message-State: AFuF++lOQyYwLDML82DwDreKyA7yNhkK6onzBko1z1xw7bGSRvhPV9vW
	QvbdFnGYnRhj4Zn6SoxH128w74OZy1g6OkR57tCGCtXFzJLtI7+8WomBELuK8Ad8EiRo/Qe18FF
	bZrVbqOcYV7AJ/oM8UyZ+NMmLFPKsI4ddFrjKUgaFswJNxER2H7F3ksnlaPj0RsvUUM0vvT08c8
	Qnrw==
X-Gm-Gg: AYBFou06G3ndT2dpEf39heO+PYv7FETPa/80AyMuEvAKT9/nj0letTTeZxEXCU11CEo
	xFAOckiLFvXkIQFcEqVXgFb1BzJC6qV7uK6VFEXmJ0FimymACmZlxegXjrKeIsPZNIO+ylEtYQH
	P02JwCy7dyCWMge1F9xGD+guCKRjii4dGHEDl38LvaA/Ynxo1WpDQt158gk4YxJeK0uryRVPI+8
	6xVu+YnUSFnZ3OIQIVQzcpRrYfZqpK+kLVEdk5v/EqyhkVL5ifZBgHDAc/jEaj5YatWcaHvoMck
	sQbZMQa/gB5A2uifHeepnS9ni4fNnJnoOV/lXyw+dM3/8dZSGJQIpiomlJj6YD/Tmtb2dY6QMIN
	23JSI2wRbcu3Vrpa2kyzyqLbMrpzCNbsdGcQ9BIM4v49ok/eGxqbVAg==
X-Received: by 2002:a05:7022:b042:20b0:128:d20a:2f40 with SMTP id a92af1059eb24-14503fc0c9emr3358104c88.8.1790289414007;
        Thu, 24 Sep 2026 15:36:54 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:20b0:128:d20a:2f40 with SMTP id a92af1059eb24-14503fc0c9emr3358092c88.8.1790289413429;
        Thu, 24 Sep 2026 15:36:53 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c505sm1379403c88.5.2026.09.24.15.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:36:53 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:36:49 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>,
        Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 12/13] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
Message-ID: <20260924153649.00001584@oss.qualcomm.com>
In-Reply-To: <20260924152739.2865510-13-andre.przywara@arm.com>
References: <20260924152739.2865510-1-andre.przywara@arm.com>
	<20260924152739.2865510-13-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E0RufBta0h9jRDzUx4r82Uj228gQ9JFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfX6foDoj0uSYOQ
 t3k8+hyjR81V+99Q+OT1nuHp8p1bJk4ZIIRPyRD1zNtTVcIe0Zu1YTEr/5uK4cGDJCPTlxvgVrJ
 DU6G+M+scP09YUMGxkHrHVO7E9uoEejI/AlStnEZLw5JZGgzTTxGpcZncu7CEiwKX8HpG5XnC90
 scrYyVL+58ojWDNwqVioQ+j5KXterjlYewLPrjmVkwH6kS5gfWyfoPDYL8fA0efxiJQu3nlAJHU
 jFVIg5k9P8hdlTFRGqMEYaxBiwiM2/jwMTg8yXF7Cc0pTgiZmOWYYL4c92+GD+IEBPqIpsqnHJ8
 FadBaeayg2rYkTb4fWazoGRo5mmdBLn20QARQVbGU7knjVNRyuBXoylCnpT+ZD8E+VqYgh4Jzvi
 gJH+olUo+MCrO+B89HyNvGdjM2nRH4Tp2Zp20f8Vta++JYf4TR74ey0CrpjQI7DUe02QrJppKrI
 qSD4Zsrw9a3C9NvKZZg==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab5a607 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=kM4gzuUOBcDNVL6HCnIA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: E0RufBta0h9jRDzUx4r82Uj228gQ9JFv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MiBTYWx0ZWRfX49/2oRUMsi7U
 /JAUNVf45Nq19qZI7Acbd07j0pgd1MsJqj69a4IWyfqN4P9SBAzXrl+H9+54svq+I0HYFz6xNZE
 5Y+UlHmaC/K/ZqL2nz0EJJzZcusscFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_233700_795151_0FD6EE8E 
X-CRM114-Status: GOOD (  20.88  )
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

On Thu, 24 Sep 2026 17:27:38 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
> based MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which requires
> a (potentially sleeping) MSC access as well.
> 
> Change the error IRQ handler to be a threaded interrupt, but keep the
> handling in the hard-IRQ part for MMIO MSCs. This is needed since the
> CPU affinity check in the MSC accessors requires a non-preemptible
> context.
> When the MSC is using an MPAM-Fb based access, we push the work into the
> threaded part of the handler, where the accessors are allowed to sleep.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> The actual IRQ handler learns how to deal with errors. We cannot really
> handle them, but we can try our best to disable the IRQ anyway.
> Should the level IRQ line deactivation fail on the device side, we mask
> the IRQ on the irqchip level, to prevent an interrupt storm.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>



