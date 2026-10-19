Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C0B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=swjokahp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWLJ+KLw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YgsunDo1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=; b=swjokahpP3DN85hCEK7mq5T4L+
	snTuxTtw9tWMumQffaWnIljeigHddQA0QwwNMZZ3nLgfdUiYCGjnL7fnsiL9M72gwFZfXe3kxxgUV
	EVFCDVTxF9dHlroKB2mJTwcE+yNeZBQ/zR3h+oBk+4mVy1SpsTvYrcUPrBDA15bCP0GfxiALnT6BN
	gLGp7ewU8a1Senx8Zu95dNeD0WttGB04Mh/VAS3wX9aVQPPn0Z60x9YQCFBQAd5mob4KBgSWjfiTX
	miTLDm3i4Z27BCjDact+fcMlY2mLI1XtbkqCkH2+mONADupAzv/RXMB4x6FnjIo5Qc/Dcew+NEGOL
	qGbRzIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuV9-00000008Lqw-3u7A;
	Mon, 19 Oct 2026 21:02:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuV7-00000008LqO-2GsW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 21:02:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJKBpU4107103
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=; b=iWLJ+KLwsyLtbo8g
	7uhBHNgEeXH56UX1iDgdr7ckbrl9UcP8hYvhmJnWZksrEdLRGVqd4KePkrhgBJ6a
	9/4T9I4HH+fVyfRKhXGGs8ZUbEUtH7qPUqi93fcBXiTQSw+1ttJ0J5IUeMhne+Jv
	o9z2umVaBQrwb6IDHIwqLQ/gqe0KJVmbPZ3dMq75pfL9gLthJXupNJWdCdG875jo
	mu08ain1Ki9lDk6XdIvQS9nkQ+5BaDRkRcQJORRr27XVIs0hDn0iKwKh1hcTsAVg
	6z7QllGcKXJzalgoqqRlJ1qq/DlC+KVhwj2MMIqnPcMAymgNX3TwJyeMfatct3ud
	OD6Ebg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr780m18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:02:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so7489592eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 14:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792443751; x=1793048551; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
        b=YgsunDo1Ep8KHinSu8qxk1xD5RIKW7NgTvTqK1sojYNse3KwLIHQDFxWs66apufsyQ
         XdJf+VjYt7esCnCDSIPgqL16AqoIsVsk8+EpU127fa+6P73QwOKDgQgDQ0aKNEB4xil7
         CqOkDAyiLsUwmLwn4U56NIKY3W3peI/cPVbKRqOzhAXE8Rea5f4bSoWMiyK0qdunduwr
         DDphTxElmB5VNx2BjkgYST7iyYY4AXygD1WKbOcCmvaREU++mupwQTQ1/pYrp9gqCRgH
         wrKa2nsIOCcbOI7eTWie+/WbtFCXDpJ2auAaj5GpUxX0zExQgtwtTA7PoW/M3N1C0N0k
         03uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443751; x=1793048551;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
        b=t+Zfu+l0Zh4Io8R2UWLdg6MqL3B+xsjgrxH/f4Xg2bzsMVhb9bdhV1XxHREIuD8iPl
         6ksQ3Y45VXGC4mK7LpTxCp+vt2JRHLPXuD7EBz90PIyolaQgBRXRQR2ILrfPZzagURCa
         4acvtWXBliFvlmWtFM5bI76XzAn+QZyevjrLLEMu9P8C7u4E1pIgK2mV8j+jTvW8KneX
         jCcnX/MO5L9XDoMuOVJESSMpxzySrYOqX7b/73e/U+gXdIlgNEeGt5+py5oLKnaz34JY
         fh3gDIKIQx2UzOR3YwXaHmIFgJjAdzR8K4SNAuQ099BAkZ+Z0KcyeAfQgjsxBJNYqlc3
         PnlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUwV3jpY0tMtFZ/sHtkvOcIVvHGgotNwKdVxjioF8ujGYZ1zeOsFaH6e8s6CBBsOuQvC3MnfqjtIFbMRiTu7vU@lists.infradead.org
X-Gm-Message-State: AFq9FYIQ4ufXiGYdErTwRX4SdwyoAqY8xexfPl7IkD/rSx2AvZn0gRKL
	tp76Jrs0ZdPp93EjdxJZp2LX3Ac0sjcJyNvmhmmuvGa8JaQecIFwsS72/OFNJ8Pal0Ciemexxm0
	cKrhPfXD5z4FYO06dBIWnwVhpVN5L57l7bJjtnG1rNGi/Gy2/EtYUMzOvOUYONtri0Ltscx8hig
	rfbg==
X-Gm-Gg: AYBFou344Q5J2AwljnObBtqr1eoPkVORKnEmej/chfVEvOP6pcPCA5kp0I0+fHluhZi
	sbXb05nOMRgREGbID2hw/7fEp6QsZ4O6fBzecuNLQQelfwxNZoWcH0CvV17H9perZM925o8kuLg
	MHu8+cV7znhi/V73lIq5WZR+DIMUmtm6TQoTxiUiIH4l+jQ0gGcOi5x7oDEolyYFYMtbNuGTBJL
	l+9y9AuOD7VkMUWIXl2Tw1XUGJ3SY7nFa0BZhX0PdoJS4ChZzDQvsFPhKA123/zA6qZGBdqoV8p
	ubL7KxIWY5tjQo2b9WH/bSg/Ld049oyFt4PjGuk4eWh5N3yJrC3NdbLYug2qC3KjSNMmzYCqOqx
	SjPHHq8tYzzlQ14AeNpiu0XdO/G7nOmm/AHMWb5KJWw==
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr12731877c88.20.1792443751045;
        Mon, 19 Oct 2026 14:02:31 -0700 (PDT)
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr12731519c88.20.1792443735366;
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm32711150c88.1.2026.10.19.14.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:02:03 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 04/32] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20261019140203.00000f2a@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-5-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-5-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX8/e+efm5JvCp
 OCHKileuI8Sd9Bsc2UuJsH5wAMY97BI1y+SvV9g+9MY4XyBJe2ld3WYzQGE47vuzD8JxhxKb8VH
 DYQKkizfJN0zRfbH15nbHYO2ePy4hiLqA4y3IobbgFISU6c8UCuntnarpJRS9htTYj1ITxd09TQ
 4LMeJgEvkexNr+dAaT2j/FZdk3PhL5EJC8PnV/WuQ7TOJzELG0ZA8+06irLue3KJCcDvBm/Yd2x
 YA06PC+k/zaQJ5UKcMnCnE0WZ/kUBZVl7aAYfL48xqD943RYs3JzSpv4VwCNMh3wIa3mlhJgnfD
 57GyZ4nZOdjQr4Gzarzn3LBVRQgKIaEIsgiyJC95t9Yu+o6RZa12lBeBs3Cu2kTzC7/JkMDryYo
 AqGOaomRUBhSiAwyX3ClgEeXOADAEeQpJhZPq3w+OIfiqSoK5nkL48SRSpfdIpHurozQeUvNJ9+
 gqH7x8irc7lkwjo2FbA==
X-Proofpoint-GUID: U5LZJy4pS7wmouwnY_ScTdYiXbP2o8La
X-Authority-Analysis: v=2.4 cv=LKnz05W9 c=1 sm=1 tr=0 ts=6ad68568 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gIk6nJaUoXxf6RY8mAcA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX57M097Z8hc+N
 vrQX+EmT7NlXI1AziRrqmISaXimHRVQvbFPXyqVPmcw22XG8cH+LRG/Vx+TSd/CBavtM0h/ysDz
 dc9o4cOBybUq5ivwiggcbVjDLjHpKJk=
X-Proofpoint-ORIG-GUID: U5LZJy4pS7wmouwnY_ScTdYiXbP2o8La
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_140233_724978_C208510D 
X-CRM114-Status: GOOD (  14.63  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 19:55:25 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Protocol notifications are typically used by SCMI drivers to detect
> and react to particular conditions: this was the assumption and the classic
> usage scenario upon which the SCMI notification framework was built.
> 
> Some protocols like Telemetry, though, could be interested in enabling and
> registering for such notifications: in such a scenario each initialized
> protocol instance could want to register a common protocol notifier.
> 
> In order to reuse the existing SCMI Notifications machinery, allow
> protocols themselves to register for their own notifications and provide
> their own notifier callbacks.
> 
> Each protocol, at the end of its initialization phase, can now provide one
> unique per-protocol-instance notifier block, which will be registered, by
> the core SCMI stack, on the related notification chain: such notifier will
> be automatically removed during the protocol de-initialization phase.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Whilst I'm not that familiar with this code, it seems fine to me
(i.e. needs more eyes despite the tag)

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

