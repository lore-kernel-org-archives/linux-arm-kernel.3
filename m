Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE11606EE93
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iEw5BiNh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGWCSay3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=; b=iEw5BiNhQlSN9X
	6zu8VBpGi+DK4zsrkBZrCwJR6w6edYfo0GP7nWBrUjE++k0mz/rtFiN3vdA1uQiLgg+nnXW9IiRWQ
	bwIKTz8nCSPZBOQyahQefl6bHvTWy1qttHx+ge9zvYyW5xZ4OXNSicEjTa1KCkqSF5MrPARch8HI9
	vd/R2PXd+faBrCdyeQDaZPl8nexU0gCHBjTZeUIUOPj4W/fiE2wze/aRfAlnRHcGkf8OpaY+Fsu+0
	OdQCeM58s/yQZLxlSo6rb/mhT/9JxVUJtm3ksl/TQ/szuWMAI/1JSPHiX6mEbCIrFnCJCtOn6ibyu
	Mx1kn8xHOK/Pq3StktgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvtR-0000000HT3q-1vGc;
	Mon, 02 Nov 2026 17:32:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvtP-0000000HT3J-06yD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:32:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3487559f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640740; x=1794245540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=PGWCSay3uNmobAh2apj7AR+HfubMjHm5nt9ifP+NUDO4QUjU8fkM0kpkhHMQWP/mRE
         6pbXZohXLPQTEVmqtLN1yajYyi4l0xRp8p9K8nugrGPGfJl3SpkemwM5tsmmKdQ1PD3X
         ZSgd0oEt8iLvjDEUaO/qi3zfRjX6vQS9LlXddVdkHCPoZfmoO8zNMe2row5YmaOBYbIh
         o0rKub4cEYM9hbT2xozYiDkfSgFYozDPzhYzvC7iBaHeloCbndAcbLlAYArqWOtOBDO8
         CW7RtIdNRBAxqJ68EiVIowBthKFqp6G5Vy17kf9i5jPgScy2SIKQfu40IlJ0eU3dl0mG
         lLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640740; x=1794245540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=ihGLUWpyEtfO84PLoEFZW4TRiOpVJWkaYDcQK85ULi1GN3B7SmLjInrv+SDrGzd9j4
         cAr4SD2PGB1XgS/9kTjL9nVNpPysBUwEE3eT8HW1Q+WamEgXZdpRPypqa4weYOm8/+W0
         eeDxpraKQYE8yNqs7jqPN9AvLwXO9HuHQZduVF/yc8knw9ST66UPGChJ3FNWiViKZ4z8
         KT4eDoRNBkQT7Z6u1d1niRDd2vS1vzr22iAqHoWnZKXgdAFvF2frRP7F967o8qtFXISa
         bdxJ4gMc0KPo2i9L23YIVsZCA2adLFJcp7tn1x629BfltePW1AvwsAS3Z3scZpfiESSZ
         mXGg==
X-Forwarded-Encrypted: i=1; AKwUvBweN+gT/JUIDcFTXSgXGG6GJZvdF2k2uI2DaJf4N8xnE+QiAO7oQKOIPaFaiQbYSbgBfd6A/p/dWw4DrpII1zl4@lists.infradead.org
X-Gm-Message-State: AFq9FYJWmaruBhYtHR+7XRB5h/o2ZlqpOC2Irp4AeVscarcyRMf/sg55
	yLdzvCFw9OACQLyGBUsvyCOz8kwfJKlDuhQJs8H5AOTsWIYAhgN3EBIG
X-Gm-Gg: AYBFou0Kik10L5w/guff8m10EKgOUAlZu+o8aau0V8FSxqIdjuffR0GDRAJ52FH314O
	D4PH9ybaM1esvqoGOwiLElwPOwmz+bVyl9l/2aF5DTVGU+MnjULfHgxobpCpZgiDN4pboQ/ZruJ
	93b3j7p67cNtKfeyG7Un3n7aVzsuSq2k0+BZukCqJi7uIBPFC3GM3beDHB1q9zYyPTidyl6ExKt
	fK0Bidy9ssqzZW+lZcSSUEaZp0hbpgr2wcZiniXP+fo90f3y32vdHF3Q/0WIRM4n/cACYEf8Icn
	RXueYmQHoa7ieykonb0X0j1IkTtvyVdfQ/RmWgAiHdWqp2V5lnlRnnlfXRAjzGSYRy18jgZqE2T
	zNmVJ2O23udjOVrpYz9bnW2EWs+ZFURXhkCnSS3CtMxRqsl0Z2by5sx81qwPDgKVMYjn0TE2n5q
	tMqafPZ014g1k1fBXf85ej5Fn64OTi1Dd034TJjyO5JQC4WyHuQgFyQQWwpXOVzwtQQ37a9LwsE
	mcQIhCWj+gvXh7iaB27mr9JJN2ymWyRIlw0fems5MWpN+y5UHuFnRNx580YLR8ZuW5nVzSbaRU8
	nxuBrBykBcfPQ+ju+oaAH+QufCDE9apLKOi3fsk7qHLUiW3Zl7khWhkn+B077bp0fSBh8eBkyEI
	KzxxTEm8qfVtLnCLu+pWM
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr263780855e9.16.1793640740359;
        Mon, 02 Nov 2026 09:32:20 -0800 (PST)
Received: from [10.0.1.67] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm2039345e9.15.2026.11.02.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:32:19 -0800 (PST)
Message-ID: <8abc611c-525e-4450-b924-87dcad57a578@gmail.com>
Date: Mon, 2 Nov 2026 18:32:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
 <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com> <auTPTxt5ioBJrr27@SMW015318>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auTPTxt5ioBJrr27@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_093223_091305_F727719D 
X-CRM114-Status: GOOD (  18.54  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/30/26 18:09, Frank Li wrote:
> On Thu, Oct 29, 2026 at 07:55:41AM +0100, Emanuele Ghidoli wrote:
>>
>>
>> On 10/28/26 22:05, Frank Li wrote:
>>> Does it only impact superspeed? High speed work?
>>
>> No, it's not even enumerated, on the Dev board.
>>
>>>
>>> Thank you report this problem. Suppose below patch should fix this problem.
>>>
>>> I have not time to test it today.
>>>
>>>
>>> Frank
>>
>> Tested, it doesn't help.
>>
>> xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
>> of_dma_configure() and the new code in of_iommu_configure() is never
>> reached.
> 
> Finially, it is hack at uboot.
> 
> 592: static int config_smmu_fdt_device_sid(void *blob, int device_offset, int sid)
> 601:     prop = fdt_getprop(blob, device_offset, "fsl,sc_rsrc_id", &proplen);
> 618:     ret = fdtdec_parse_phandle_with_args(blob, device_offset,
> 620:                                          "power-domains", ...
> 578:     err = sc_rm_set_master_sid(-1, rsrc, sid);
> 681:     prop = fdt_getprop(blob, offset, "iommus", &proplen);
> 848:     if (is_imx8qm()) { ret = config_smmu_fdt(blob);
> 
> 
> Need combine power-domains with iommus.
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> index 176e2e332f87c..cc2b9a212780f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> @@ -189,6 +189,7 @@ usbotg3_cdns3: usb@5b120000 {
>                         phys = <&usb3_phy>;
>                         phy-names = "cdns3,usb3-phy";
>                         cdns,on-chip-buff-size = /bits/ 16 <18>;
> +                       power-domains = <&pd IMX_SC_R_USB_2>;
>                         status = "disabled";
>                 };
>         };
> 
> Frank
> 
>>
>> Emanuele

Hi Frank,

this works. xHCI comes up fine and SuperSpeed devices enumerate again, with no
Host System Error and no SMMU faults. Tested on Apalis iMX8QM and iMX8QP on
Ixora carrier board.

A comment: imx8-ss-conn.dtsi is also included by i.MX8QXP and i.MX8DXL, which
have no SMMU. I get if we should put the property in imx8qm-ss-conn.dtsi, next
to the iommus property it goes with.

Thanks,
Emanuele


