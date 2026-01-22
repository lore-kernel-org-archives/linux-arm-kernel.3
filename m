Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3574CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtnrJRwuZD3x27d/web3RPkR4d6q04QoAp40kmt0WLQ=; b=L0/71bx3EyXHLoMsHXqfXWHCE8
	mqFYEy5eq7TMLBbi6ADEU4bidsSh7DdHNQYZ8/85GOUh3JHlmkThioUHemcjuxsynxPkGgnxjfWb0
	d0jbFFQxkK8N9D087GMJM/LZRU6cxIqJ0LmA4l+bD2V1nMHOKWCmeghbpF4tObfSlEXCVG9aOxPbx
	wtXoLwhwzgLvfPovkddoietkwbjwd7BgzOGU/w5DPBiCOFymVBWgwfE3Vkfd4Ocb5TzMeoUCHC0RD
	8kYzeNBRY+feW0Z9Tdnp5IuAu/VQ/1TDQIm06tig82N9uqDPZ+3q2u/APktrSjPIy/kxO9Bpr6sok
	2p4lic2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqRc-00000006gjB-0s0e;
	Thu, 22 Jan 2026 08:53:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqRa-00000006giz-3mrG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 08:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=xtnrJRwuZD3x27d/web3RPkR4d6q04QoAp40kmt0WLQ=; b=reNaSuqFuvSCOePmcL4stvBLBM
	R/xxvGZ7+Re/Pj+AVIIZ6h0i24yxl2eoD/YbrnZ/3sQW7M3Hmlp2FSIL8AFK/7v58GyKrTf67tRUq
	MId5pFXbj1yfOYtmFgEZf6qB6Ss3V09YqM3j5XZJU+Mv7RMX3B1SJaqIKdfaQsuwz5j2eMuqID7c7
	Nnd0oy5xf/1apBktM7NgHSHH7McVu0FCZuOZnAaRl5nJzJVdo3pOvuwiHYEIE0pT79AiiSlCT3tLK
	WiNrhD2MDduGOQQpNTAfMl0VqKdvP+a+9JdP8kAsnA2bXJMwmhP9y9ISFFKfzjtO2LHFqFsEYHzyh
	nlK1gY0w==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqRW-0000000HaHa-3URp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:53:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czk4+RbQJ8CiysAKfw+gm0tvx/Ti2PmZStDRWo7gmq/MHjP/YKRMsZQVNJjwjOrRF0Pg8FOPNaVpZGXKFYSmuZSTIRv2JwE3ZKW6sRRO98he1cU0t+ErIFAiJzLUJZ10G3qegs8wNaYL3k/DTmebJ3NchcZJ/kwaSzSF+oBO3A7xmhIbU8QT9Bh8m+XNiZ+0IWqYVSBY/CZ7amQ0mIOcirH8abDh+PVLuOp6k+ysvX8eJDO+hFJtz738OQz69UMUpfH+2+JAuPR08t/rSwrkbxWXMO7ewzatD5HizfIUvEZgQ3mGMb1/VsVfy2kUVimYXc1mOrzcYvWpwEtu/xMSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtnrJRwuZD3x27d/web3RPkR4d6q04QoAp40kmt0WLQ=;
 b=stRpHUip+DyTeRlBr/irLg096SE0Vkptg041N2xIaa693csdA1ee70wxYLfOzow1diQYXb/R7ogHG9rp3FS0cClZlJVp55+4Qq+tjMQ3gF8cf++UcYz0kvudFzi29DniN1xGrz5+1h52Q6Iw8B5bWgd+YAcNYHwQ9u003Shukp0Egsjn/1tK1A0VZ7x+DZ2EVta4jsmwUYrZ4Jp1woLNmpiAgKyt5EtYxp8LLWoWP6sQA0WGel2vz8mpKHjEWmWmM7hVN/18OW5A8jMXn+eHjiy1rGWjN5YBr4obwgZWLrBJGE5L3nNB6lPtSV6iLIK9J+076MbELWIxDekCYZtWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtnrJRwuZD3x27d/web3RPkR4d6q04QoAp40kmt0WLQ=;
 b=wd4JXORk+dshPLeRFuKgB7RzKgngddwzqvfma765WKpzuKfSOJc+kvPYRD1ZM/pTWiCLwQEewn9mClrZmL3STS2x/BZnYn7M0u44HXcZaOwls0zfzqCEu+enNCPKezKp3+wnj8r7Li7zI2dCQzJUrN3l26ldltQA5qOzj5abNZ8EMo3pRggkeUzdd4xv+jjYhVZ8Opi5LlT7Z5KgzieBB/CME3reGYtFEjvBFtdIkccUH+jmztw+EuBeI/VZduHW5mG8vrpgieWc+Faejb9vWH7k1VGiPU+F8DADB6U87RQ5dRVFgrqz5ARlVC+0iE0O4XgeOBgmUCjlV2bPXE7hMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB10052.eurprd04.prod.outlook.com (2603:10a6:800:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:53:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:53:22 +0000
Date: Thu, 22 Jan 2026 16:53:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64: dts: imx93-evk/qsb: add
 m2-pcm-level-shifter-hog to enable BT HFP
Message-ID: <aXHlfIDSgFqiUuiF@shlinux89>
References: <20260121111346.2598783-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121111346.2598783-1-sherry.sun@nxp.com>
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: 1152eef8-7ac3-47a6-cfa2-08de5993b23f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3BveXp4bW85K0RFalV4ZjNhMlJDeXpzQVc4d3d2bXJXNlB5K3F5bDdSMWp4?=
 =?utf-8?B?eFhPYkx3elhuRkZGOUJIZG82azVvS3loVUxDRkZORjA3bzBDZS8rOUMyRURV?=
 =?utf-8?B?c1VKVzByZFlRMmJwTDB3V3B5VEd6TG53UDJGc2lRMVdXT1JaM0xsTTZlM0gw?=
 =?utf-8?B?alR3NHpaSFpQVWhoWkdEeUdCNkl5TWQxVWYzYzNwNUhmbzBEUk5ScWhtdll0?=
 =?utf-8?B?SW14aVVvUFAxcUlyTzhCc25sdU5ERk5WNUIwWFNrcjh0dXJ4c09iU1VmQTl4?=
 =?utf-8?B?OEFzSlpDN1VveFBqYUsxY2c3VDNyajk3WVJjWHNsZkZJNUlCQkpidFp4VXc4?=
 =?utf-8?B?OTIzYm1VU3dVR0RFaVlyRy9ESDVVdFdFOWwvNEY5Z2R2MjN0UU52UXZ1NUJH?=
 =?utf-8?B?U1VYUVYxZE1vVDBCUVlXZ210cDJDbHhhL3BtaU1CU2dneXVEa3g5L3dLdHhK?=
 =?utf-8?B?ZVRZNlZGa3psdEhYS0JjenhJUnNXTXRicHo2K2lNNUdmUEpSaW1lQUtsZEFp?=
 =?utf-8?B?cC9FZHNVTk5Qdm40V2Q4NFNYNTdPYlhPV2NwQ3gvcHhldVhPK3NzZjR2dHpo?=
 =?utf-8?B?anhhYUZ0STgrMElZb2dQTFl4Z0pNWElkcXFraU9QZTNQaXZiQmRuakMwNUxK?=
 =?utf-8?B?V3Y4d09ld1lpSndUQ1g1YWEraEpWZElqdkR4QWZGZXJUcUZkSStOYS9sK05R?=
 =?utf-8?B?VGdadFkvR1JsS2xhbTVLQ3hLZmNCSTBrUGFmL3YyNjBRNWZ4SVRqblVDN1h1?=
 =?utf-8?B?dWVsTDd5U21DQ3R2bG8xeVV4U0xIZjdlSTlLTVRlend1UEpBYVc5TG5qbHFF?=
 =?utf-8?B?Z2lpRm9NVnRQTFBoR1U4bmFRR0hQcVdEalBNekZTUzA5MWFhZURBQ1hFWDZ6?=
 =?utf-8?B?d2x4Y3l0QjNWYSt3dW1rT1pGMUh1S3FMV0JxakVZZGV6K1YzS2lNNy80dUpS?=
 =?utf-8?B?TG9nbzUxYjlsdUlCb0xoRTZwQ3ZlSEZOS3dZU1gwSHlEUEYvWkFaQ3VrbE4x?=
 =?utf-8?B?dXl3SUlKZjRsNWk4cnZHVGh5WUMvQVpwUWxwdkZjNWpVOE1ZSkUxL0NJcXhl?=
 =?utf-8?B?eUlRZnJIU0I5TXlxVVkwNmJHWEZpSEhFRjlKdkNrTk1uZ3RnOC9GRURkbGtx?=
 =?utf-8?B?czFLU0ZEVkRsbDUrSU1EbE9jNUlFdWdWY0d5RGpHWFIyYTAvaUExVmJEYk9P?=
 =?utf-8?B?YkpsRTROVk9MWkNVTmZveDUwT1ViMmdNM2U4WXUwNmFnRUI4MTN1dnFhcDA2?=
 =?utf-8?B?K3RrS3lhSmZYVncraVFQdVBjeDc0dUVWTFRpY1FiaVFnUHNiZmdRNHl5bjJh?=
 =?utf-8?B?TWZqYnNNaktvaGlsRG1tb2ZJVFZzOUdQNGRBc3VuTk5QelJ0RlYwc1VXZ1Js?=
 =?utf-8?B?eFdQNFZtNXpoY0N5YmtlbVZjSkZFOERQdzJGeEc3YTV4N3ZleFJjRkJqdTVH?=
 =?utf-8?B?SmJvQlBOR1FuTGVlMjJ0S2g0dGpCZTZSamZzaU45K3BBVDNjcXhGdW95Mktn?=
 =?utf-8?B?dWJFbi9lWmJndWJ5VDBTSERieDV1eDJWdXRHVmhlaWppY001c1RWZ1J1bDVH?=
 =?utf-8?B?UFUrRm45aFczamVpVldCODhFVjAxaW82K082OU5XSC9KdVJUUHY5bEhOeFlk?=
 =?utf-8?B?eVJ5ekU1ZllzaCtGbVlRdG5jUTlQQitlTG93YThKd2xSUnkySnFtdkcxMzlD?=
 =?utf-8?B?ekVEV0hkQS9BLyt4V1pYWFE2ZmVhMlJpdi9VWTJORkFmVUE0alJGUitWZVQ5?=
 =?utf-8?B?MGFxc3VVYU9HeUpGclBHT2RwekVteU9XTk1tM3h0eTBPZGRKVXdtOUFralBK?=
 =?utf-8?B?U3BsbUhFMWhaamJud1NoVjRuOW1iK3dQaERqamN0SEdvQjBZK0p1VHByWDdZ?=
 =?utf-8?B?dElxZHpmU3NEU3pINjExTnB2Z1Z1aGp5R1hPWGFMeTBma3RwR2tyZWRnckE5?=
 =?utf-8?B?anFTcUVkSnBtbFVLTmkyRWpuOUM2MWlBMzdxZ2IvalhCck1MbUlYUFlTdVpx?=
 =?utf-8?B?TnZjYTQreXd1d2s2Zk9Kdm81eE1Zemp1Wkt6Q0tqT253MEE4eXA5VTZOSEw5?=
 =?utf-8?B?VzRDOTJ4WHVkQ09qdVVXRWJBK005TDU5bmhabmxLaEhUdW5qSGpiWUs5VkxH?=
 =?utf-8?B?YURaSzFWdlRqamd0b25JdGVIZmxGOEd6ODdmeTBlcHpibi9HZU9UbGlsNnc0?=
 =?utf-8?Q?UyZolZkndckNin7qCEZCwQ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9lbGxnWGNVRFV4QmFWY3crN3ZDcFhkNEN1V0dEcU5kbU9zV1doSmc5d3F2?=
 =?utf-8?B?clE5OGl5MENzKzF5aFBobTFkdS9oMmp0Zk00cU1US253L0NqQ09aVGJSN3pq?=
 =?utf-8?B?WHVLb21GR1FlYVlDN0RlenRTOEJwYVNvOXlFaytkSkdoeFV6bHVGekFQQUVl?=
 =?utf-8?B?cUlFTzZhaVFRTmVKRUpaRWZKWjIzTUM5STdhRU1iWE01cEx0cGUwa0JaZG9i?=
 =?utf-8?B?UDdXS2xqVGxlNTh0K05hT3hLZ1gxSWJlVDdyTTJjb0tOSEF2dURPUWtSL3dz?=
 =?utf-8?B?b2ozYmFwRXRPV1lQMnkxRHZMOHpvZEFtV1h5a1c4VzE0S0o4bXV1cWlyK2R3?=
 =?utf-8?B?VnBMOTdEMURzeXhXZDZLdkM2aUg0Nm5GM3VjMCt6aEVsYVRNZ3FjTjFxRjZz?=
 =?utf-8?B?R2MwSjk3Z01qTUFuOVlUOHhjUFJYOXlCYW40UHFyM1JJWk8rVXRlT1I2b0w3?=
 =?utf-8?B?WStjOWplbVlYdEJrUjVvNTYxOTNFeDl0SkFnUVpNamMxMXM2b3pySVVqTDVy?=
 =?utf-8?B?WW9VRXRya011SXZ4all3SWt6T1EvczNVandVazhIVkNBdHpLMWtwSCtJUng2?=
 =?utf-8?B?ejNlUFFyQXNKVEZsN2dSNEdKQUIxay9tczF1L0JaMzJISlplWDRvRStQOWV0?=
 =?utf-8?B?MGVoRW11bkdJdStqR3R6MHM2b25MZExXWmJHRUltcmJnSElqc0JZS1FaUm9L?=
 =?utf-8?B?WkdubDFDZU5QeUlVM3BTRlVEcis1dVhKcXhxcXVUWHAxQ3laZ01VQnNaRkJ3?=
 =?utf-8?B?ZkRSQmhlT2xMZ1d5dC9tTnVlTW9CZnFIdCtzNXg3RTBURTVkb0FTdDBRVmtT?=
 =?utf-8?B?U3h0alY5OWRLSXEvYlBpb3Boejg0UXpMWE9RTEFaWHRLMXRya1hOcGg4ajUv?=
 =?utf-8?B?aVBLOXAydDM1ZjdTaEhxR2ZIQ0Y4MnFoSG9ZT3Blb2VCM1EwVWw4Y3FxSG8z?=
 =?utf-8?B?RTVaa3ptdlBCMEwxNEFHNWM0a3lxMW9td3hxNllmcnNqMEhmc3MrU1FzNVFT?=
 =?utf-8?B?U3czNTRvK2EyUTJ5MDdaL2NlSzF2V1RLcGgwL3A3V0RQVW9aYU9RRjdvSjc3?=
 =?utf-8?B?TzlIMXprR09YVGQzRGszcUttcUp1TEJyQ0VlQms3WmFZU1B0U2RpbHg4OE1Y?=
 =?utf-8?B?U01hRnhJU21CMERBUnlaQmhLVGtobzEwT0lraTRudTZQS0srbTdsVTR6TVdw?=
 =?utf-8?B?Z1lZY0RwdVI2NDkzamNpZEYzaXZDdzV0ZWovY05YbXArSVZod3lBYlY3eVVK?=
 =?utf-8?B?L0pMUXltSzMwbUVWaTVmYnZGajNOcFkxZ1BWQ2xSakZkdVhPYlJJUG8wK3JZ?=
 =?utf-8?B?bWcvRTFSSFNFMVM3N3h0THFiUm1ZT1RKT0dwd0FEbnU2V05JUVAzdTVnalBZ?=
 =?utf-8?B?a3J3QUZjN0t5ZHM0V3Q3eGZtcTVPV2JVUjVaNzBuK2tFclVtU2o4UmtDbkdh?=
 =?utf-8?B?eE9ZVzlkTmgwdXg1bkcrMkUrRU0wLzA1RHQwRHJ4M2VXOXNQUU1CWTViMU1S?=
 =?utf-8?B?cHlzYUl1aGFQYzhGb3VDcGtrNmVkNExLaFB1aUt0NmJtMDR4TWRsR1c0ZlM3?=
 =?utf-8?B?K0tFMHBHTUN2ekFEallzWFlxd2U1YlF6TExVakgxNDM3RTdBMmN4MUwxN2JP?=
 =?utf-8?B?bXFSVnRmVWhiWE53WXV4L00rT0cyY2FuNzRNU0JLb3czQXdTem4rVzZSc1oz?=
 =?utf-8?B?cjZ6N0FSUzFxejJHNkh6WG03WTBSYUZ1NHU1WkxKNVBPRlNPWEVjMW45Skp3?=
 =?utf-8?B?Nnk3UTlMem1TaHZIVVU1UmtycEdHM0ttQ01hck4rRXpUcmQ4YWJDYnpzbWky?=
 =?utf-8?B?a3Rwa0xBcnJOa01ub3ZlKzFISXZnTnhYOVZUUFllaHlNbVMwS1FrMEYvcmtF?=
 =?utf-8?B?SVptTkRFUkJnTGd0Wm00VzJXNWVCMWxGNURSeHI3QjJWbnozVTI0RlBILzhu?=
 =?utf-8?B?bTBWL1Y2UHNSZkhFSjBheG1URXR0QTZIUnpZYjFxU0paMW50ZzFQTHdWUXhZ?=
 =?utf-8?B?cmpLUFZpNy96RXBHanMyMnhvVlcxbTVqZmpTd0M3Wk0yVXJldC9wcEF3NUpo?=
 =?utf-8?B?UkNDZnRVZDVqS0c2aHV2dnRoMWNtTVZLY1N6VWtJWWtuRTJrQ1d1eERlc2Zr?=
 =?utf-8?B?VGpndDFmU2NYOHdzWWpKalkxd3BtMFBzQ0hPZTVkZ20xU0hGRHJVVFczM2Fk?=
 =?utf-8?B?M05SZm5sUkJmOGR3NzUySFVtcm9DOUhvRG9rZ053RFBZL3NycllaalFTTTFQ?=
 =?utf-8?B?eXllZjJLQ2ljcFUvRmhUdmNMTkdPSWlHQ1hSazJ4ZStFRVdXU1ZsaGY4VU1j?=
 =?utf-8?B?aE5IR3lGRG1USWZhbldkRmpkVnFGUWxoMDhncW9uU0NNc3JMVjFUdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1152eef8-7ac3-47a6-cfa2-08de5993b23f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:53:22.2317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hmpoQkmkCxpBCUdLnzKD4EjV9ccTeNPw1UPqfAoLhsfu81wFpsBoXW43tOVEDzBJwW+kXjTMDZS4sTxZB+XZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_085331_476838_69F9BF34 
X-CRM114-Status: UNSURE (   9.94  )
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

On Wed, Jan 21, 2026 at 07:13:46PM +0800, Sherry Sun wrote:
>For i.MX93 11x11 EVK and 9x9 QSB boards, add the gpio-hog to enable the
>M.2 PCM pins level shifter connected between soc sai1 interface and M.2
>PCM pins so that HFP feature can be supported.
>
>Since the HFP is only used at a later stage — after the BT firmware has
>been downloaded and the BT connection with the remote device has been
>established — both the pcal6524 expander and sai1 interface are already
>fully initialized and available by that time. Therefore, using a
>gpio-hog here will not introduce any probe ordering or dependency issues
>for the HFP use case.
>
>Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

