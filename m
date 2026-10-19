Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 20:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IoYFpTF+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c85oB9L/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I3svuMOc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i66f027a2fvWrHzOUQKFbeRuC5NYtmte7oNPdO77ZEM=; b=IoYFpTF+KVAV1nQAnqSDFr72qR
	zwy2IaTQ/xLKKKXauzGGTuLf8ECPfiFxNsE5xRHRQGci4tBxKPHohH4m+PgR6VutCQ18qmWHhVW3g
	OQZaaUievmqgVAOiAVqpSGQ2F81AaBIYa+gMs4156pxx7HzfdyCIrchJeLgzGw8vDOlMJ3Loi2/Qw
	z08A8gdLGfWrfDiryrNLd8pbzKLkZO3UDJjXeDYQXDRlte1xM/GeId2xvq+o8tHyqfZd11Vu1EAe6
	hShrhOyS7sKUlqX3DG9qcago9toDTmFL9MBZ73+GGcsyG4s40gm+IGxeatotLOiQH9fb4o8h2b/Eh
	V6TWiRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuGH-00000008KiL-1XbJ;
	Mon, 19 Oct 2026 20:47:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuGF-00000008Khu-2gWp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 20:47:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJKJlr4107298
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 20:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i66f027a2fvWrHzOUQKFbeRuC5NYtmte7oNPdO77ZEM=; b=c85oB9L/ttWD3DI3
	j5a1EP/lz73swN31wwZ/uAEcNqOxfohgnNNhIzuvLaNoy7yihUjx2XYAJa0NukA6
	mVGsolWsAJoPzUs0ChV5hz3WQYY08WmKzu8bYyj1zzOQVJxAuYW25vmi/U8das7N
	9diXIpQWC8e0ohwVC5gtziFLQJpFTpluPw7xjsUZklTNxzyIUAeZ7WNGRoL99b/m
	KIM/20GLwpKKYnTm63gavifZ9lN04kbVCV+XXtHUznXjTPGrtRzeN1GExPTwxZ9X
	qvnNO2W1Bb1DXc3s666eF5Ik21vURClCNhib6oxqdmJOwzVvMW681HdBaomykbqE
	RAJIeA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr780jg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 20:47:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so8577242eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 13:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792442829; x=1793047629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i66f027a2fvWrHzOUQKFbeRuC5NYtmte7oNPdO77ZEM=;
        b=I3svuMOcvqsyn+e/yrqF9t9+DDMX+BEKmUT2ei/mp2xvEbqS8d2xKRFpVZdm5BXuUp
         1Fd+7MH87qvdC6rs8gr1NA7XtxLFySqAq1rki7TVfhouATcsg31k/sT6CyDCGITAFyJp
         tcTDvg2FqJk+Rg91GQE6oaXmJMiD+jZ2wsnmaNBghHGNNlA3vc1tzK0raOXmkbc60Fnn
         aL0u31c6NiVMNkHdCEgAXHw03mgoT/YLwGMhwKmpVILW2rTGhnf02i9ydXXbShXrCh2J
         SHzLjzU/2DA8D8ibo86c/ILEi06C9v8656phP5CDLGfFwkL/ODw/CYe5xoVQxB67Qbxp
         t0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442829; x=1793047629;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i66f027a2fvWrHzOUQKFbeRuC5NYtmte7oNPdO77ZEM=;
        b=OaSu5NKV+gM/W+tfhDIq0FkKO5bX0tFeE66jTqeMvW3tDUPrPfhqHwvHe3/l7akreX
         FdT3CedoueUJ3KL/CwHrAoPNsnf+iu4+w9/Pm9Bo/lYGHdbquvyXvJk0Fzsh2ATDZWEw
         SQdZVjQ03IXKsRejRc5Rdel/x72u+LDpwyDbAK+FFMBpnIOQjWDLMlejML7g2eAqPfDV
         ClhrXClzaRNaz1GcGH+dcsNjay3+AUByKcteJexep4ce0KFvoKXsUEuOzNFMLBNGAX91
         OceaKEPYNraPqcitV5C+saQl57l0OXq2pBAg27JjXT9bsaoHRbsGSrk01mDfheN4beCD
         p4hg==
X-Forwarded-Encrypted: i=1; AKwUvBykoj3uVrqFXSsd+02+VVDYh4xQZdaEX/5zJCU8eYJ5CXXIXCXUyTyzFmej4BVXxxsSVjW5Ya4r4cgKTn5unsq0@lists.infradead.org
X-Gm-Message-State: AFq9FYKxGqOb5dr+09SH2hf12vZR0hxilFx85ZKJH85r5QoNZeZHIjoa
	3ElgGoxb6BNDaYq9f+rK01AeGgjD67hxOHHV0pB9vBDAxmGsmB6k05mrU0dj7h+sPJGlfrbwvYa
	NpuEcvoXTmBc3aUv2Df/50u+x/z0QzKDODuRbJWMmqBmE6ndkV4rVFNGXS+3Y4K2rFAL4rUN/Ha
	EGBA==
X-Gm-Gg: AYBFou2aU7PvQID7wEbvcbINs2iEh9zaM/Ze1ylNks/FWtrWjM9UKn4TndAgLYFQxXH
	iuRWfU7sVUXfMw/lsblLG5pfbJlNgC1fa0oes5FIpJvOu0EWrTlmg1eMhkMMoAQIZHdqM7f3M7m
	iO2QQlD84IS+FGFiey+XEEuyA6rRe0MGuHE2o5vVrVNyHeUzwlrv9vXDwefVE2hY3MNw9XIYCna
	eJSCUib1ZD0k70qeO2KjTPr59hvyw//or6ARsnCDaHpEhKoySJpzVxfXkSa3nThQ27ceH6OIS4B
	EzwEzg8L7AuJZkdzq+sToVvb9hthAvzXoj6IaQ16fAdaCjZMhknZ/hyLnW/23DSsaHyHSONjwMP
	4zPrc0JX0139mB3HyiLwr262Ni6aWvBKnnKa2ZByFmg==
X-Received: by 2002:a05:693c:4003:b0:351:6409:25c9 with SMTP id 5a478bee46e88-361a2942adbmr13915310eec.35.1792442829163;
        Mon, 19 Oct 2026 13:47:09 -0700 (PDT)
X-Received: by 2002:a05:693c:4003:b0:351:6409:25c9 with SMTP id 5a478bee46e88-361a2942adbmr13915262eec.35.1792442828380;
        Mon, 19 Oct 2026 13:47:08 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm38362321eec.0.2026.10.19.13.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:47:08 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:46:57 -0700
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
Subject: Re: [PATCH v14 03/32] firmware: arm_scmi: Refactor
 __scmi_event_handler_get_ops helper
Message-ID: <20261019134657.0000624a@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-4-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-4-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX+1z7UmPUGBbW
 vrCUhFzjvXbGuTD3fY4KCXO9pC6w+IYt4Bp4l71ljuo4j5fuZmTlEShW/sZoGQTBA3IK510HWLR
 xnJPzCS1wsIjLM373CDiC7ju3jw+TVaW/RMykLzj88PTDvxqNepkFWzfV44S7/tNQ4nu2DLrKdC
 NdOUEqlzxwtaE36ZHU7BQt6z2o8JPNikrQu5nJwCAd04aX5dZoWJz80uoaC0KOW3fPO8VIfyK4b
 pT+GzWV52QrkQMbV598EQhcjMnN8KnZTIi0vW4E2t7eJ33881VkdfDciADbX2qhGfnYVRyKGqEQ
 RMlUjvteRHc9YCJda0i6CiMrvxKo3jY74lsJT5tr6PQgtMrXLIowDpYiAUH9Pc+XiO+ei5l97MD
 fbrsPS8lFV7RuLu+YF6sejK2fZTAGXg80SJ4lSWzpvtm+KvXZjPSa4ubj+qVVd67076XvZNjTZN
 uimIHw7lnZ2/lH4Y3Sw==
X-Proofpoint-GUID: olm8Ke2ujHyxw6VuhiELZKus46YqkdII
X-Authority-Analysis: v=2.4 cv=LKnz05W9 c=1 sm=1 tr=0 ts=6ad681ce cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=0wFYMLthbzNeuU8dIDoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX1P1GobUxCeur
 hWiJZYZTk0DMLxyXX5TuFvl7JPPdc/rgU1tHHDl7Io9mOXDDYRpyhAyZG8OYw3xHTG4Uzc0PvER
 NtGj+pWwYpOUhEl3LbNirNolToVIJnU=
X-Proofpoint-ORIG-GUID: olm8Ke2ujHyxw6VuhiELZKus46YqkdII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_134711_812297_301E4ED1 
X-CRM114-Status: GOOD (  22.90  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 19:55:24 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Refactor the __scmi_event_handler_get_ops notification helper to simplify
> its logic and make use of guards for locking.
> 
> Mostly no functional change, in the sense that while the functionality
> remained the same, a richer set of errors is returned where before was
> always a -EINVAL.

Maybe mention why scmi_allocate_event_handler() is now wrapped in
an scmi_allocate_pending_event_handler()

I like the change but beyond logical division of activities it
isn't immediately obvious why that split exists.

One really minor thing inline that I don't care that much about.

Anyhow, both trivial so
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/notify.c | 73 +++++++++++++++++++-----------
>  1 file changed, 46 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index 7d1bb424a723..2bc2e03df639 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -890,7 +890,6 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
>  
>  /**
>   * scmi_allocate_event_handler()  - Allocate Event handler
> - * @ni: A reference to the notification instance to use
>   * @evt_key: 32bit key uniquely bind to the event identified by the tuple
>   *	     (proto_id, evt_id, src_id)
>   *
> @@ -903,8 +902,7 @@ void scmi_deregister_protocol_events(const struct scmi_handle *handle,
>   * Context: Assumes to be called with @pending_mtx already acquired.
>   * Return: the freshly allocated structure on Success
>   */
> -static struct scmi_event_handler *
> -scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
> +static struct scmi_event_handler *scmi_allocate_event_handler(u32 evt_key)
>  {
>  	struct scmi_event_handler *hndl;
>  
> @@ -914,8 +912,20 @@ scmi_allocate_event_handler(struct scmi_notify_instance *ni, u32 evt_key)
>  	hndl->key = evt_key;
>  	BLOCKING_INIT_NOTIFIER_HEAD(&hndl->chain);
>  	refcount_set(&hndl->users, 1);
> -	/* New handlers are created pending */
> -	hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
> +
> +	return hndl;
> +}
> +
> +static struct scmi_event_handler *
> +scmi_allocate_pending_event_handler(struct scmi_notify_instance *ni,
> +				    u32 evt_key)
> +{
> +	struct scmi_event_handler *hndl;
> +
> +	lockdep_assert_held(&ni->pending_mtx);
> +	hndl =  scmi_allocate_event_handler(evt_key);
> +	if (hndl)
> +		hash_add(ni->pending_events_handlers, &hndl->hash, hndl->key);
Trivial but I'd keep to a strict errors out of line
	if (!hndl)
		return NULL

	hash_add(ni->...
	
	return hndl;

It burns a few lines be saves a few brain cells.

>  
>  	return hndl;
>  }


