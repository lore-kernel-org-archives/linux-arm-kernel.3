Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF13C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qh/KNveqcXCTBcx72ejlKl8SrMCLTgKOABRLWwoibo=; b=r1yhajw2FiNr3hvzg9KcqsTDC4
	ucCOAoAFUB7zPdft54nT02r3rCIAc0DE0Q1mIGFE7gAPNodyJueDlIgq/M7dnj6jY47oY63M+44mo
	OxcoSV6MuHPRCy45a632wFBdtt1/fv+6bQjM3/bFArr8rZcKMItd7ZIKI1cTOi933N88ZtsuMVNLV
	0c96dKzb3AXRwkVkPBFnTLnfu5kSg75DyV6aWib7liRVTLjJWbiqsaMsFc5na3+pAAtduMkjBn9vM
	gtXBgKSJxfoKlXidKl1jht+p9gTYk/CTp5qBJSN81JDCEIkHugkmQ7L6eYdL8wLGJT6eXUTpD+peW
	V4RhXxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSgx-00000006mbO-1tNA;
	Mon, 13 Jan 2025 22:13:51 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSfi-00000006mRm-1M58;
	Mon, 13 Jan 2025 22:12:35 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa68b513abcso862716366b.0;
        Mon, 13 Jan 2025 14:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736806352; x=1737411152; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9qh/KNveqcXCTBcx72ejlKl8SrMCLTgKOABRLWwoibo=;
        b=U0KVY3T0a1m8XB8mBlXvRcgmPF53usdbot3eqI9a9GwmmPycEkbVPOk+57srG721Wf
         RX2r/PZO40sk/L0Kp4cpGpPvON3UbIO/qVi8LDHvj+HOQoqvg0Fd+gjKsHuWxKz3W2yh
         SQBei6yLWn20/cRRwjVOZYY/80BZiTf/sF3kLlhnWm3/mpmnGDgWvhcEsfshvUCKhixh
         LX4CPOS/ZGDsKMU5AO3+WjaF7jAzhKoCShGbuPY5485EOhe5NJdu0SKJuQrZxhZHWMzc
         obuUfFhNlc/7fXuDWS4z74Yy1rV7WviVtOIzry6Wgiy0BdkTY3SvlsCbAh8NyPGcZdpb
         ljow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736806352; x=1737411152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qh/KNveqcXCTBcx72ejlKl8SrMCLTgKOABRLWwoibo=;
        b=Q+rVktGEicSyz020ag33ErCS1DlrxGQj/VahiUSQXFcaKEGoT/kHtApwIPcLST6BiC
         GUKR5kPNb/OOKVES1w79U5JDYBjEm5Q4bPPYARjiaJudXujlfKpjlhIhNfaNFhthvtsM
         fLqjBi1eSPR9DEHlkv9HgmjQM+cIJrEiFgEL8T6oXLX+TxbAjAXKzw63jRrQcNvLIVNF
         kjRDRCCIbIS3VWJbjWm7+wUXjcko9ipsjUCqI+xabt56JQaNw3aQa5GSXZRvdVvnnnvh
         qowfCvTJtn8wPj+BSn+MEWOLntHkZj1+ee4C/T14734NysB0oo6hKEfQ09shTDMSUYs/
         PeIg==
X-Forwarded-Encrypted: i=1; AJvYcCVVSHf/dEwcCQ16qEsgXo5LRUrSkuPmyuOkAmX+o4gjbUFSfdjdXnmYExogIXeLDFa2DiT5j6L03KhCTOMpXCM=@lists.infradead.org, AJvYcCWN1ckEcf7bd9O0Pme5eqQrkwGQLizK1qVo8Hw2ebtWCkReBW4yts5pdonsdsdPS0CQHCzqRcjtJJxl09yB7+7p@lists.infradead.org
X-Gm-Message-State: AOJu0YwXyj68iBGQCyoIJoa54PbNH9FkCxq5dknxVnqDKvjK8PEzqsJH
	ASpLZ/1kox7KgJ0M7f7218M0NcZj4/48614fHvHPWJI5rMxXIlJP
X-Gm-Gg: ASbGncs1t2Pcx2Rh3Q8PySf9FbUE1hdV48z4hahsdXeRgATZMqyhVmqwu7Z75s2kIuj
	Z+BAqIkbrQARrHK39BXYlyKvJciOzER2EflbpXmBYS5QDiInKRr7sg7qAf8QtI+orcXoSupRQwo
	Kqqz8nzIuRNEtrWyAiJSZwebtjCuhnpsR9OZSEaltqABdn+/qm6Xv8Xzx7qnFZbZebivIQVYPvP
	K3jGzbZ8JGpj3bJBLM460BQUxD1RvzDhT5iCsTrVvhkwalz6nuXD+5LkD1r1sW99HncB/U4jr+t
	b+g2qnUx1zD02O//PN+In5N1+w==
X-Google-Smtp-Source: AGHT+IHraRU0fZq8qzdn794Qp1Qzg4oJLAsv5qU3CaW6U+DO/jzYcbOZOZk0YmFmaDgLKgj2EPIXJw==
X-Received: by 2002:a17:907:2da6:b0:aac:2297:377d with SMTP id a640c23a62f3a-ab2abdc09eemr2144577466b.52.1736806351505;
        Mon, 13 Jan 2025 14:12:31 -0800 (PST)
Received: from ?IPV6:2a00:f41:cfe:29b3:7412:fabe:3e5d:365? ([2a00:f41:cfe:29b3:7412:fabe:3e5d:365])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9649939sm545070066b.182.2025.01.13.14.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 14:12:31 -0800 (PST)
Message-ID: <58cb6c37-0ea0-4866-a2b1-92cb0f0391a7@gmail.com>
Date: Mon, 13 Jan 2025 23:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spmi: Fix controller->node != parent->node breakage
To: Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
 <5b139af8d639e20a14c8bd00e8e03a4a.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <5b139af8d639e20a14c8bd00e8e03a4a.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_141234_368087_0C8C4DB3 
X-CRM114-Status: GOOD (  17.36  )
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



On 1/13/25 22:52, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2025-01-13 05:02:58)
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On some platforms, like recent Qualcomm SoCs with multi-bus SPMI
>> arbiters, controller->node must be assigned to the individual buses'
>> subnodes, as the slave devices are children of these, like so:
>>
>> arbiter@c400000
>>          spmi@c42d000
>>                  pmic@0
>>
>>          spmi@c432000
>>                  pmic@0
>>
>> The commit referenced in Fixes changed that assignment, such that
>> spmi_controller_alloc() always assumes the PMICs come directly under
>> the arbiter node (which is true when there's only a single bus per
>> controller).
>>
>> Make controller->node specifiable to both benefit from Joe's refcount
>> improvements and un-break the aforementioned platforms.
> 
> How is it broken? I see spmi_pmic_arb_bus_init() calls
> devm_spmi_controller_alloc() which sets the of_node to the parent device
> and then spmi_pmic_arb_bus_init() overwrites that with
> 'ctrl->dev.of_node = node' later on in the same function. That will
> cause one more of_node_put() than is expected. I don't see that removed
> in this patch though, so the leak is still there?
> 
>>
>> Fixes: 821b07853e32 ("spmi: hisi-spmi-controller: manage the OF node reference in device initialization and cleanup")
> 
> I've dropped this patch from my queue. I don't know if we're really
> doing anything better by managing the of_node lifetime in that function
> vs. letting the callers assign the node they want and manage the
> lifetime themselves. Maybe we don't need to do anything? Presumably the
> parent device driver will unregister the controller anyway, so the
> lifetime of the of_node will be ensured regardless. For subnodes like
> qcom SPMI, the subnodes are child nodes of the parent device so they
> won't be removed. If they are dynamic nodes, then the caller can manage
> the lifetime.

Stephen, the wrong node gets assigned in the qcom driver with
multi-master controllers, resulting in probe failures.

Since the introduction of the commit referenced in fixes,
of_spmi_register_devices() sees the controller's subnodes
(which describe each of the two masters) as slave devices
- meaning no "real" devices ever get to probe

Konrad


